function SERP_sensitivity(range,pax,MTOM,C_D0,AR,eta_total,loading,EWF, cruisingAlt)



range=range*1852;
reserveRange=300000;
cruisingAlt=cruisingAlt;
loiterAlt=5000;
takeOffDistance=500;
rateOfDescent=1.524;
rateOfClimb=8;
payload=0;
battEnergyDensity=100;

#current airplane model: beech king air B100 [close zunum competitor]
airplane=seriesHybridAirplaneSENSITIVITY(MTOM,battEnergyDensity,C_D0,AR,eta_total,loading);
mainMission=missionConstruct(range,cruisingAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
reserve=missionConstruct(reserveRange,loiterAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
airplane.POF=1;

PAXweight=97.5*9.81*pax;
battweight=(MTOM*(1-EWF)*9.81)-PAXweight;
battmass=battweight/9.81;

airplane,mainMission,reserve=flyMission(airplane,mainMission,reserve);
energyused=sum(airplane.powerProfile)/3600;
energyrequired=energyused/.7;
specific_energy=energyrequired/battmass
max_power=maximum(airplane.powerProfile);
specific_power=max_power/battmass
return specific_energy,specific_power,airplane


end