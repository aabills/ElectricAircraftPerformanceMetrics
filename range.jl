function pnm_battweight(PAX,mass,battEnergyDensity,ewf)
reserveRange=300000;
cruisingAlt=7890;
loiterAlt=5000;
takeOffDistance=500;
rateOfDescent=1.524;
rateOfClimb=8;
payload=0;

#current airplane model: beech king air B100 (close zunum competitor)
airplane=seriesHybridAirplaneMBED(mass,battEnergyDensity);
mainMission=missionConstruct(2e6,cruisingAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
reserve=missionConstruct(reserveRange,loiterAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
airplane.POF=1;



PAXweight=97.5.*9.81.*PAX;
battweight=(mass.*(1-ewf).*9.81)-PAXweight;
airplane,mainMission=findRangeNegativeEnergyAlgorithmWithExternalPackWeight(airplane,mainMission,reserve,battweight);
range=mainMission.range
    return range,airplane,mainMission,reserve
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
cruisePower=airplane.powerProfile[airplane.segmentTransition[4]-2]
energyInJoules=sizingError*3600
additionalTimeInCruise=energyInJoules./cruisePower
additionalRange=additionalTimeInCruise.*airplane.velocityProfile[airplane.segmentTransition[4]-43]
mission.range=mission.range+additionalRange
airplane=reseta(airplane)
mission=resetm(mission)
reserve=resetm(reserve)
airplane,mission,reserve=flyMission(airplane,mission,reserve)
return airplane,mission
end