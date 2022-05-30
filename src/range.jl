function pnm_battweight(PAX,mass,battEnergyDensity,ewf)
    
    if (mass<=75000)#Regional
        wingloading_lower=292
        wingloading_upper=565
        wingloading_mode=400
        
        AR_lower=7.62
        AR_upper=12.6
        AR_mode=12
        
        C_D0_lower=.014
        C_D0_upper=.024
        C_D0_mode=.016
        
         eta_lower=.85
        eta_upper=.95
        eta_mode=.9
        
        EWF_lower=.35
        EWF_upper=.5
        EWF_mode=.4
        
    elseif(mass<=125000)#Narrow Body
        wingloading_lower=433.58
        wingloading_upper=788.617
        wingloading_mode=500
                
        AR_lower=7.795
        AR_upper=10.47
        AR_mode=11
        
        C_D0_lower=.014
        C_D0_upper=.024
        C_D0_mode=.016
        
        eta_lower=.85
        eta_upper=.95
        eta_mode=.9
        
        EWF_lower=.35
        EWF_upper=.5
        EWF_mode=.4
        
    else#Wide Body
        wingloading_lower=504.35
        wingloading_upper=755.98
        wingloading_mode=600
                
        AR_lower=7.91
        AR_upper=10.056
        AR_mode=10
        
        C_D0_lower=.014
        C_D0_upper=.024
        C_D0_mode=.016
        
       eta_lower=.85
        eta_upper=.95
        eta_mode=.9
        
        EWF_lower=.35
        EWF_upper=.5
        EWF_mode=.4
        
      end    

reserveRange=300000;
cruisingAlt=7890;
loiterAlt=5000;
takeOffDistance=500;
rateOfDescent=1.524;
rateOfClimb=8;
payload=0;

#current airplane model: beech king air B100 (close zunum competitor)
airplane=seriesHybridAirplaneAllParameters(wingloading_mode,AR_mode,mass,C_D0_mode,eta_mode,battEnergyDensity,8,1.72/2);
airplane.auxPower=(1000*PAX) + ((airplane.W));
mainMission=missionConstruct(2e6,cruisingAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
reserve=missionConstruct(reserveRange,loiterAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
airplane.POF=1;



PAXweight=100 .*9.81 .*PAX;
battweight=(mass.*(1-ewf).*9.81)-PAXweight;
airplane,mainMission,energy=findRangeNegativeEnergyAlgorithmWithExternalPackWeight(airplane,mainMission,reserve,battweight);
range=mainMission.range
    return range,airplane,mainMission,reserve,energy
end

## Find Range Given Pack weight
# Alec Bills; Carnegie Mellon University
# Most Recent Modification: January 11, 2019
function findRangeNegativeEnergyAlgorithmWithExternalPackWeight(airplane,mission,reserve,packweight)
#Finds the range of the airplane using the negative energy algorithm. This program is iterative though Im not sure why 

airplane,mission,reserve=flyMission(airplane,mission,reserve)
energyUsed=sum(airplane.powerProfile/3600);
energyHad=(packweight./9.81).*airplane.battEnergyDensity.*.7
sizingError=energyHad-energyUsed
cruisePower=airplane.powerProfile[airplane.segmentTransition[5]-2]
energyInJoules=sizingError*3600
additionalTimeInCruise=energyInJoules./cruisePower
additionalRange=additionalTimeInCruise.*airplane.velocityProfile[airplane.segmentTransition[5]-1]
mission.range=mission.range+additionalRange
airplane=reseta(airplane)
mission=resetm(mission)
reserve=resetm(reserve)
airplane,mission,reserve=flyMission(airplane,mission,reserve)
return airplane,mission,energyInJoules
end