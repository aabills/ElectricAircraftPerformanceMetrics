using Distributions
function SERP(range,pax,MTOM)



range=range*1852;
reserveRange=370000;
cruisingAlt=7890;
loiterAlt=5000;
takeOffDistance=500;
rateOfDescent=1.524;
rateOfClimb=8;
payload=0;
battEnergyDensity=100;

#current airplane model: beech king air B100 [close zunum competitor]
airplane=seriesHybridAirplaneBasicPropModelOn(MTOM,battEnergyDensity,4,1.72/2);
mainMission=missionConstruct(range,cruisingAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
reserve=missionConstruct(reserveRange,loiterAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
airplane.POF=1;

PAXweight=100*9.81*pax;
battweight=(MTOM*(1-.395)*9.81)-PAXweight;
battmass=battweight/9.81;

airplane,mainMission,reserve=flyMission(airplane,mainMission,reserve);
energyused=sum(airplane.powerProfile)/3600;
energyrequired=energyused/.7;
specific_energy=energyrequired/battmass
max_power=maximum(airplane.powerProfile);
specific_power=max_power/battmass
energyrequired=energyrequired/1000;
return  specific_energy,specific_power,airplane,mainMission


end

function SERP_altitude(range,pax,MTOM,altitude)



range=range*1852;
reserveRange=370000;
cruisingAlt=altitude;
loiterAlt=5000;
takeOffDistance=500;
rateOfDescent=1.524;
rateOfClimb=8;
payload=0;
battEnergyDensity=100;

#current airplane model: beech king air B100 [close zunum competitor]
airplane=seriesHybridAirplaneBasicPropModelOn(MTOM,battEnergyDensity,4,1.72/2);
mainMission=missionConstruct(range,cruisingAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
reserve=missionConstruct(reserveRange,loiterAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
airplane.POF=1;

PAXweight=100*9.81*pax;
battweight=(MTOM*(1-.395)*9.81)-PAXweight;
battmass=battweight/9.81;

airplane,mainMission,reserve=flyMission(airplane,mainMission,reserve);
energyused=sum(airplane.powerProfile)/3600;
energyrequired=energyused/.7;
specific_energy=energyrequired/battmass
max_power=maximum(airplane.powerProfile);
specific_power=max_power/battmass
energyrequired=energyrequired/1000;
return  specific_energy


end


function SERP_Distributions(range,pax,mass)

    if (mass<=75000)#Regional
        wingloading_lower=292
        wingloading_upper=565
        wingloading_mode=451
        
        AR_lower=7.62
        AR_upper=12.6
        AR_mode=9.2
        
        C_D0_lower=.014
        C_D0_upper=.024
        C_D0_mode=.016
        
        eta_lower=.65
        eta_upper=.72
        eta_mode=.685
        
        EWF_lower=.35
        EWF_upper=.5
        EWF_mode=.4
        
    elseif(mass<=125000)#Narrow Body
        wingloading_lower=433.58
        wingloading_upper=788.617
        wingloading_mode=616.98
                
        AR_lower=7.795
        AR_upper=10.47
        AR_mode=9.188
        
        C_D0_lower=.014
        C_D0_upper=.024
        C_D0_mode=.016
        
        eta_lower=.65
        eta_upper=.72
        eta_mode=.685
        
        EWF_lower=.35
        EWF_upper=.5
        EWF_mode=.4
        
    else#Wide Body
        wingloading_lower=504.35
        wingloading_upper=755.98
        wingloading_mode=651.68
                
        AR_lower=7.91
        AR_upper=10.056
        AR_mode=9.02
        
        C_D0_lower=.014
        C_D0_upper=.024
        C_D0_mode=.016
        
        eta_lower=.65
        eta_upper=.72
        eta_mode=.685
        
        EWF_lower=.35
        EWF_upper=.5
        EWF_mode=.4
        
      end

#Baseline Parameters
range=range*1852;
reserveRange=370000;
cruisingAlt=7890;
loiterAlt=5000;
takeOffDistance=500;
rateOfDescent=1.524;
rateOfClimb=8;
payload=0;
battEnergyDensity=100;

#Distributed Parameters (No Range)
wingloading=rand(TriangularDist(wingloading_lower,wingloading_upper,wingloading_mode));
AR=rand(TriangularDist(AR_lower,AR_upper,AR_mode));
C_D0=rand(TriangularDist(C_D0_lower,C_D0_upper,C_D0_mode))
eta=rand(TriangularDist(eta_lower,eta_upper,eta_mode));
EWF=rand(TriangularDist(EWF_lower,EWF_upper,EWF_mode));
    
#current airplane model: beech king air B100 [close zunum competitor]
airplane=seriesHybridAirplaneAllParameters(wingloading,AR,mass,C_D0,eta,battEnergyDensity);
mainMission=missionConstruct(range,cruisingAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
reserve=missionConstruct(reserveRange,loiterAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
airplane.POF=1;

PAXweight=100*9.81*pax;
battweight=(mass*(1-EWF)*9.81)-PAXweight;
battmass=battweight/9.81;

airplane,mainMission,reserve=flyMission(airplane,mainMission,reserve);
energyused=sum(airplane.powerProfile)/3600;
energyrequired=energyused/.7;
specific_energy=energyrequired/battmass
max_power=maximum(airplane.powerProfile);
specific_power=max_power/battmass
energyrequired=energyrequired/1000;
return  specific_energy


    

end
