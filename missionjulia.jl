
using COESA
mutable struct mission

        #Mission Constants 
        cruisingAlt::Float64 #Cruising Altitude, m
        range::Float64 #Range, m
        rateOfClimb::Float64 #rate to climb, m/sec
        takeOffDistance::Float64 #length of takeoff field, m
        rateOfDescent::Float64 #rate of descent, 
        payload::Float64
        
        #Atmosphere Required Constants
        g::Float64 #acceleration due to gravity, m/sec^2
        gamma::Float64 #specific heat ratio
        R::Float64 #Gas Constant
        L::Float64 #Lapse Rate
        density0::Float64 #Density at Ground Level
        troposphere::Float64 #Elevation of troposphere
        tropospause::Float64 #Elevation at trpopospause
        pressure0::Float64 #Pressure at ground level
        temperature0::Float64 #Temperature at ground level
        
        #Calculated as move along (vectors)
        density::Array{Float64,1} #air density, kg/m^3
        temperature::Array{Float64,1} #Ambient air temp, degrees C
        sos::Array{Float64,1} #speed of sound, m/sec
        pressure::Array{Float64,1} #Air Pressure, Pascals
        n::Int64 #Vector index
 end

function missionConstruct(range,cruisingAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload)
            #Constructor Method
	    missionout=mission(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,Float64[],Float64[],Float64[],Float64[],0)
            missionout.cruisingAlt=cruisingAlt; #Cruising Altitude
            missionout.range=range; #Range
            missionout.rateOfClimb=rateOfClimb; #rate of climb
            missionout.takeOffDistance=takeOffDistance; #Take off distance
            missionout.rateOfDescent=rateOfDescent; #Rate of descent
            missionout.g = 9.80665; #Gravity acceleration
            missionout.gamma=1.401; #Specific Heat Ratio
            missionout.R=287.05; #Gas Constant
            missionout.L=.0065; #Lapse Rate
            missionout.density0=1.225; #Initial Density
            missionout.troposphere=11000; #Height of the troposphere
            missionout.tropospause=20000; #Height of the tropospause
            missionout.pressure0=101325; #Pressure at sea level in pascals
            missionout.temperature0=288.15; #Temperature
            missionout.payload=payload;
	    return missionout
end

function resetm(mission)
    mission.temperature=[];
    mission.sos=[];
    mission.n=0;
    mission.pressure=[];
    mission.density=[];
    return mission
end

function atmosphericparameters(mission,airplane)
	mission.n=mission.n+1;
	atmos=atmosphere(airplane.altitudeProfile[airplane.n]);
	append!(mission.temperature,temperature(atmos));
	append!(mission.sos,speed_of_sound(atmos))
	append!(mission.pressure,pressure(atmos));
	append!(mission.density,density(atmos));
	return mission;
end