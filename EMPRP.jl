include("includeme.jl")
function EMPRP(range,pax,MTOM,EWF)



range=range*1852;
reserveRange=300000;
cruisingAlt=7890;
loiterAlt=5000;
takeOffDistance=500;
rateOfDescent=1.524;
rateOfClimb=8;
payload=0;
battEnergyDensity=100;

#current airplane model: beech king air B100 [close zunum competitor]
airplane=seriesHybridAirplaneMBED(MTOM,battEnergyDensity);
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
return specific_energy,max_power,energyrequired


end


EWF_vec=.35:.01:.55
p_out=readdlm("NB_passengers.csv",',');
r_out=readdlm("NB_range.csv",',');

se=zeros(21,41)
powerpeak=zeros(21,41)
totalenergy=zeros(21,41)

for n=1:21
    for m=1:41
        if((p_out[n,m]>2)&&(r_out[n,m]>2))
        se[n,m],powerpeak[n,m],totalenergy[n,m]=EMPRP(r_out[n,m],p_out[n,m],100000,EWF_vec[n])
        end
    end
end


open("SE_NB_SHASHANK.csv","w") do io
    writedlm(io,se,',');
end

open("PP_NB_SHASHANK.csv","w") do io
    writedlm(io,powerpeak,',');
end

open("TE_NB_SHASHANK.csv","w") do io
    writedlm(io,totalenergy,',');
end

