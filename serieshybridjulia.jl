mutable struct seriesHybridAirplane
        #Energy Storage properties
        battEnergyDensity::Float64; #Energy density of the battery
        batteryMass::Float64;#Mass of the battery 
        batteryWeight::Float64; #Weight of battery
        fuelWeight::Float64; #Weight of fuel
        electricStorageFraction::Float64; #Fraction of weight for energy that is stored electrically
        fuelStorageFraction::Float64;#Fraction of total energy storage weight used for fuel storage
        energyStorageFraction::Float64;#Fraction of total aircraft weight used for energy storage.
        batterySOC::Float64; #State of Charge of the battery
        turbineBSFC::Float64; #Brake specific Fuel Consumption of the turbine
        
        #Aero Properties
        wingloading::Float64;#The set wing loading of the aircraft
        
        #Propeller Model
        numPropulsers::Float64; #Number of propellers included
        propmodelstatus::Bool;#Whether Propeller Model is enabled
        propRadius::Float64;#Radius of Propller
        
        #Other Aero Properties
        b::Float64; #Wingspan
        S::Float64; #Wing reference Area
        C_D0::Float64; #0 lift drag coefficient
        K::Float64; #Aerodynamic Coefficient K
        AR::Float64; #Aspect Ratio
        e::Float64; #Oswald's efficiency Ratio
        u_ground::Float64; #Groundroll frictional coefficient
        C_L::Float64; #Lift Coefficient
        alpha::Float64; #Angle of attack
        C_L_max::Float64; #Maximum Lift Coefficient
        TOP::Float64; #Take off parameter
        
        
        #Efficiency Properties
        eta_prop::Float64; #Propeller Efficiency
        eta_mech::Float64;#Mechanical Efficiency
        
        #Weight Properties
        emptyweight::Float64; #Weight of the aircraft with no energy storage or payload included 
        W::Float64; #total aircraft weight
        
        #Saved Quantities
        powerProfile::Array{Float64,1}; #Power profile of the aircraft
        altitudeProfile::Array{Float64,1}; #Altitude Profile of the aircraft
        velocityProfile::Array{Float64,1}; #Velocity Profile of the aircraft
        distTraveled::Array{Float64,1}; #Distance Traveled by the aircraft
        elapsedTime::Array{Float64,1}; #cumulative elapsed time vector
        
        #Other Performance Properties
        turbinePower::Float64; #Power of turbine
        maxPower::Float64; #Maximum  Power provided by the engines
        payload::Float64 #Mass of Payload
       
        #indexing; etc.
        n::Int64; #number of points that the aircraft has traveled
        gamma::Float64; #Aircraft Climb/Descent Angle
        acceleration::Float64 #Aircraft Acceleration
        POF::Int64;#Aircraft Phase of Flight::::::::
        segmentTransition::Array{Int64,1}
        #POF Phases: 
        #            1: Takeoff
        #            2: Climb
        #            3: Transition
        #            4: Cruise
        #            5: Transition
        #            6: Descend
        #            7: Transition   
        #            8: Reserve Climb
        #            9: Loiter
        #           10: Descend
        #           11: Land
        
        #Current Properties of the aircraft 
        velocity::Float64; #Current airplane velocity
        thrust::Float64; #current airplane thrust
        
        #Takeoff and Landing Properties
        takeoffdistance::Float64;
       
end







#Functions
function cruise(airplane,mission,dt,string)
     airplane.n=airplane.n+1
     #Increments the plane along the mission by the
     #specified timestep in the cruise condition
     airplane=update(airplane,mission)
     if string=="main"
     	airplane.velocity=raymerEnergyVelocity(airplane,mission)
     elseif string=="reserve"
        
    	airplane.velocity=raymerPowerVelocity(airplane,mission)
     end
	
	
     append!(airplane.velocityProfile,airplane.velocity)
     append!(airplane.elapsedTime,airplane.elapsedTime[airplane.n-1]+dt)	
     append!(airplane.distTraveled,airplane.distTraveled[airplane.n-1]+(airplane.velocity.*dt))	
     append!(airplane.powerProfile,raymerPower(airplane,mission))
     append!(airplane.altitudeProfile,mission.cruisingAlt)	

     return airplane, mission	   
end
  


      
function climb(airplane,mission,dt)
            airplane.n=airplane.n+1
            #This function increments the plane along the mission by the
            #specified timestep in the climb condition
            airplane=update(airplane,mission)
            mission.rateOfClimb=8-(((8-2)./mission.cruisingAlt).*airplane.altitudeProfile[end]);
            airplane.velocity=raymerPowerVelocity(airplane,mission)
	
     append!(airplane.velocityProfile,airplane.velocity)
     append!(airplane.elapsedTime,airplane.elapsedTime[airplane.n-1]+dt)
     append!(airplane.distTraveled,airplane.distTraveled[airplane.n-1]+(airplane.velocity.*dt))	
     append!(airplane.powerProfile,raymerPower(airplane,mission))
     append!(airplane.altitudeProfile,(airplane.altitudeProfile[airplane.n-1]+mission.rateOfClimb.*dt))	
     return airplane, mission
end
        
        
function descend(airplane,mission,dt,string)
            airplane.n=airplane.n+1
            #This function increments the plane along the mission by the
            #specified timestep in the descent condition
            airplane=update(airplane,mission)
            
	    if string=="main" 
            	airplane.velocity=raymerEnergyVelocity(airplane,mission)
            elseif string=="reserve"
            	airplane.velocity=raymerPowerVelocity(airplane,mission)
            end

            append!(airplane.velocityProfile,airplane.velocity)
     	    append!(airplane.elapsedTime,airplane.elapsedTime[airplane.n-1]+dt)	
            append!(airplane.distTraveled,airplane.distTraveled[airplane.n-1]+(airplane.velocity*dt))	
            append!(airplane.powerProfile,raymerPower(airplane,mission))
            append!(airplane.altitudeProfile,airplane.altitudeProfile[airplane.n-1]-mission.rateOfDescent*dt)	
            
	    if airplane.powerProfile[airplane.n]<0
                airplane.powerProfile[airplane.n]=0
            end
		

	return airplane,mission	


 end
        

        
        function seriesHybridAirplaneMBED(mass,battenergydensity)
            #Played with often for various cases
	    airplane=seriesHybridAirplane(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, false ,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, Float64[], Float64[], Float64[], Float64[], Float64[], 0, 0, 0, 0, 0, 0, 0, Int64[], 0, 0,0) 
            totalEnergyStorageFraction=0
            electricStorageWeightFraction=0
            airplane.emptyweight = 0; #Weight of the aircraft with no energy storage or payload [737-300]
            airplane.battEnergyDensity=battenergydensity
            airplane.energyStorageFraction=0
            airplane.wingloading=400; #Average for 737/A320
            airplane.S=mass./airplane.wingloading; #Wing reference Area calculated fm historical trends
            airplane.AR=12
            airplane.b=sqrt(airplane.AR.*airplane.S); #Wingspan [737-300]
            airplane.payload=0
            airplane.batteryWeight=0
            airplane.W=mass*9.81
            totalEnergyStorageWeight=airplane.W.*totalEnergyStorageFraction; #Total weight allocated to energy storage
            airplane.numPropulsers=2; #Number of propellers included
            
            ########### AERODYNAMIC AND EFFICIENCY PARAMETERS #############
            
            
            airplane.C_D0=.018; #0 lift drag coefficient
            airplane.e =1/(1.05+.007*airplane.AR*pi); #Oswald's efficiency Ratio
            airplane.K=1/(pi*airplane.e*airplane.AR); #Aerodynamic Coefficient K
            airplane.eta_prop=.66; #Propeller Efficiency
            airplane.eta_mech=1;#Mechanical Efficiency
            airplane.u_ground=.03; #Groundroll frictional coefficient
            airplane.C_L = 0.1; #Lift Coefficient
            airplane.alpha = 0; #Angle of attack
            airplane.C_L_max = 2.16; #Maximum Lift Coefficient
            
            
            ########## PROPULSION PARAMETERS #############
            airplane.batteryWeight = totalEnergyStorageWeight.*electricStorageWeightFraction; #Weight of battery
            airplane.fuelWeight = totalEnergyStorageWeight.*(1-electricStorageWeightFraction); #Weight of fuel
            airplane.turbinePower = 500000; #Power of turbine [W]
            airplane.electricStorageFraction = electricStorageWeightFraction; #Fraction of weight for energy that is stored electrically
            airplane.batterySOC = 0; #State of Charge of the battery
            airplane.turbineBSFC = 250; #Brake specific Fuel Consumption of the turbine
            airplane.maxPower = 298280; #Maximum  Power provided by the engines [W]
            

		
		return airplane;
        end

        function seriesHybridAirplaneSENSITIVITY(mass,battenergydensity,C_D0,AR,eta_total,loading)
            #Played with often for various cases
	    airplane=seriesHybridAirplane(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,false,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, Float64[], Float64[], Float64[], Float64[], Float64[], 0, 0, 0, 0, 0, 0, 0, Int64[], 0, 0,0) 
            totalEnergyStorageFraction=0
            electricStorageWeightFraction=0
            airplane.emptyweight = 0; #Weight of the aircraft with no energy storage or payload [737-300]
            airplane.battEnergyDensity=battenergydensity
            airplane.energyStorageFraction=0
            airplane.wingloading=loading; #Average for 737/A320
            airplane.S=mass./airplane.wingloading; #Wing reference Area calculated fm historical trends
            airplane.AR=AR
            airplane.b=sqrt(airplane.AR.*airplane.S); #Wingspan [737-300]
            airplane.payload=0
            airplane.batteryWeight=0
            airplane.W=mass*9.81
            totalEnergyStorageWeight=airplane.W.*totalEnergyStorageFraction; #Total weight allocated to energy storage
            airplane.numPropulsers=2; #Number of propellers included
            
            ########### AERODYNAMIC AND EFFICIENCY PARAMETERS #############
            
            
            airplane.C_D0=C_D0; #0 lift drag coefficient
            airplane.e =1/(1.05+.007*airplane.AR*pi); #Oswald's efficiency Ratio
            airplane.K=1/(pi*airplane.e*airplane.AR); #Aerodynamic Coefficient K
            airplane.eta_prop=1; #Propeller Efficiency
            airplane.eta_mech=eta_total;#Mechanical Efficiency
            airplane.u_ground=.03; #Groundroll frictional coefficient
            airplane.C_L = 0.1; #Lift Coefficient
            airplane.alpha = 0; #Angle of attack
            airplane.C_L_max = 2.16; #Maximum Lift Coefficient
            
            
            ########## PROPULSION PARAMETERS #############
            airplane.batteryWeight = totalEnergyStorageWeight.*electricStorageWeightFraction; #Weight of battery
            airplane.fuelWeight = totalEnergyStorageWeight.*(1-electricStorageWeightFraction); #Weight of fuel
            airplane.turbinePower = 500000; #Power of turbine [W]
            airplane.electricStorageFraction = electricStorageWeightFraction; #Fraction of weight for energy that is stored electrically
            airplane.batterySOC = 1; #State of Charge of the battery
            airplane.turbineBSFC = 250; #Brake specific Fuel Consumption of the turbine
            airplane.maxPower = 298280; #Maximum  Power provided by the engines [W]
            

		
		return airplane;
        end
        
        
        
 function update(airplane,mission)
            #This function updates dynamic parts of the aircraft flight
            #including weight, angle of climb(),etc.
            airplane.batteryMass=airplane.batteryWeight./9.81
	
	    if airplane.POF==1
		airplane.gamma = asind(mission.rateOfClimb/airplane.velocity)
	    elseif airplane.POF==2
		airplane.gamma = asind(mission.rateOfClimb/airplane.velocity)
	    elseif airplane.POF==8
		airplane.gamma = asind(mission.rateOfClimb/airplane.velocity)
	    elseif airplane.POF==6
		airplane.gamma = -3;
        mission.rateOfDescent=-airplane.velocity.*sind(airplane.gamma);
	    elseif airplane.POF==10
		airplane.gamma = -3;
        mission.rateOfDescent=-airplane.velocity.*sind(airplane.gamma);
	    elseif airplane.POF==11
		airplane.gamma = -3;
        mission.rateOfDescent=-airplane.velocity.*sind(airplane.gamma);
	   else
		airplane.gamma=0
	   end
    #Propeller Efficiency Model   
    if(airplane.propmodelstatus && mission.n>1)
        t_c=(airplane.thrust ./ airplane.numPropulsers) .* 2 ./ (mission.density[mission.n] .* airplane.velocity .* airplane.velocity .* 3.14159 .* airplane.propRadius .* airplane.propRadius);
        eta_prop = 2 ./ (1 .+ sqrt.(1 .+ t_c));
        airplane.eta_prop=eta_prop;
    end


        return airplane
            
        
end


function reseta(airplane)
            #Resets Stored Variables
            airplane.powerProfile=Float64[]; #Power profile of the aircraft [W]
            airplane.altitudeProfile=Float64[]; #Altitude Profile of the aircraft [m]
            airplane.velocityProfile=Float64[]; #Velocity Profile of the aircraft 
            airplane.distTraveled=Float64[]; #Distance Traveled by the aircraft
            airplane.n=0; #number of points that the aircraft has traveled
            airplane.elapsedTime=Float64[]; #Cumulative Elapsed Time vector
            airplane.segmentTransition=Int64[];
            airplane.velocity=0
            airplane.POF=1
            return airplane
end

function seriesHybridAirplaneAllParameters(wingloading,AR,mass,C_D0,eta,battenergydensity)
            #Played with often for various cases
	     airplane=seriesHybridAirplane(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,false,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, Float64[], Float64[], Float64[], Float64[], Float64[], 0, 0, 0, 0, 0, 0, 0, Int64[], 0, 0,0)  
            totalEnergyStorageFraction=0
            electricStorageWeightFraction=0
            airplane.emptyweight = 0; #Weight of the aircraft with no energy storage or payload [737-300]
            airplane.battEnergyDensity=battenergydensity
            airplane.energyStorageFraction=0
            airplane.wingloading=wingloading; #Average for 737/A320
            airplane.S=mass./airplane.wingloading; #Wing reference Area calculated fm historical trends
            airplane.AR=AR
            airplane.b=sqrt(airplane.AR.*airplane.S); #Wingspan [737-300]
            airplane.payload=0
            airplane.batteryWeight=0
            airplane.W=mass*9.81
            totalEnergyStorageWeight=airplane.W.*totalEnergyStorageFraction; #Total weight allocated to energy storage
            airplane.numPropulsers=2; #Number of propellers included
            
            ########### AERODYNAMIC AND EFFICIENCY PARAMETERS #############
            
            
            airplane.C_D0=C_D0; #0 lift drag coefficient
            airplane.e =1/(1.05+.007*airplane.AR*pi); #Oswald's efficiency Ratio
            airplane.K=1/(pi*airplane.e*airplane.AR); #Aerodynamic Coefficient K
            airplane.eta_prop=eta; #Propeller Efficiency
            airplane.eta_mech=1;#Mechanical Efficiency
            airplane.u_ground=.03; #Groundroll frictional coefficient
            airplane.C_L = 0.1; #Lift Coefficient
            airplane.alpha = 0; #Angle of attack
            airplane.C_L_max = 2.16; #Maximum Lift Coefficient
            
            
            ########## PROPULSION PARAMETERS #############
            airplane.batteryWeight = totalEnergyStorageWeight.*electricStorageWeightFraction; #Weight of battery
            airplane.fuelWeight = totalEnergyStorageWeight.*(1-electricStorageWeightFraction); #Weight of fuel
            airplane.turbinePower = 500000; #Power of turbine [W]
            airplane.electricStorageFraction = electricStorageWeightFraction; #Fraction of weight for energy that is stored electrically
            airplane.batterySOC = 0; #State of Charge of the battery
            airplane.turbineBSFC = 250; #Brake specific Fuel Consumption of the turbine
            airplane.maxPower = 298280; #Maximum  Power provided by the engines [W]
            

		
		return airplane;
end

        function seriesHybridAirplaneBasicPropModelOn(mass,battenergydensity,numpropulsers,propulserradius)
            #Played with often for various cases
	    airplane=seriesHybridAirplane(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, numpropulsers, true ,propulserradius, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, Float64[], Float64[], Float64[], Float64[], Float64[], 0, 0, 0, 0, 0, 0, 0, Int64[], 0, 0,0) 
            totalEnergyStorageFraction=0
            electricStorageWeightFraction=0
            airplane.emptyweight = 0; #Weight of the aircraft with no energy storage or payload [737-300]
            airplane.battEnergyDensity=battenergydensity
            airplane.energyStorageFraction=0
            airplane.wingloading=400; #Average for 737/A320
            airplane.S=mass./airplane.wingloading; #Wing reference Area calculated fm historical trends
            airplane.AR=12
            airplane.b=sqrt(airplane.AR.*airplane.S); #Wingspan [737-300]
            airplane.payload=0
            airplane.batteryWeight=0
            airplane.W=mass*9.81
            totalEnergyStorageWeight=airplane.W.*totalEnergyStorageFraction; #Total weight allocated to energy storage
            
            ########### AERODYNAMIC AND EFFICIENCY PARAMETERS #############
            
            
            airplane.C_D0=.018; #0 lift drag coefficient
            airplane.e =1/(1.05+.007*airplane.AR*pi); #Oswald's efficiency Ratio
            airplane.K=1/(pi*airplane.e*airplane.AR); #Aerodynamic Coefficient K
            airplane.eta_prop=1; #Propeller Efficiency
            airplane.eta_mech=0.9;#Mechanical Efficiency
            airplane.u_ground=.03; #Groundroll frictional coefficient
            airplane.C_L = 0.1; #Lift Coefficient
            airplane.alpha = 0; #Angle of attack
            airplane.C_L_max = 2.16; #Maximum Lift Coefficient
            
            
            ########## PROPULSION PARAMETERS #############
            airplane.batteryWeight = totalEnergyStorageWeight.*electricStorageWeightFraction; #Weight of battery
            airplane.fuelWeight = totalEnergyStorageWeight.*(1-electricStorageWeightFraction); #Weight of fuel
            airplane.turbinePower = 500000; #Power of turbine [W]
            airplane.electricStorageFraction = electricStorageWeightFraction; #Fraction of weight for energy that is stored electrically
            airplane.batterySOC = 0; #State of Charge of the battery
            airplane.turbineBSFC = 250; #Brake specific Fuel Consumption of the turbine
            airplane.maxPower = 298280; #Maximum  Power provided by the engines [W]
            

		
		return airplane;
end

 




