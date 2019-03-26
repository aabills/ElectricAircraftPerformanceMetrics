#main airplane code
range=500;
pax=180;
MTOM=109500;
range=range.*1852;
reserveRange=300000;
cruisingAlt=7890;
loiterAlt=5000;
takeOffDistance=500;
rateOfDescent=1.524;
rateOfClimb=8;
payload=Inf();
battEnergyDensity=100;

#current airplane model: beech king air B100 [close zunum competitor]
airplane=seriesHybridAirplaneMBED(MTOM,battEnergyDensity);
mainMission=missionConstruct(range,cruisingAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
reserve=missionConstruct(reserveRange,loiterAlt,rateOfClimb,takeOffDistance,rateOfDescent,payload);
airplane.POF=1;

PAXweight=97.5.*9.81.*pax;
battweight=(MTOM.*(1-.35).*9.81)-PAXweight;
battmass=battweight./9.81;

airplane,mainMission,reserve=flyMission(airplane,mainMission,reserve);
energyused=sum(airplane.powerProfile)/3600;
energyrequired=energyused/.7;
specific_energy/battmass;