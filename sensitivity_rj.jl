include("includeme.jl")
include("sensitivity.jl")
rj_eta_nom=0.72;
rj_eta_min=.72*.9;
rj_eta_max=.72*1.1;
rj_eta_vec=LinRange(rj_eta_min,rj_eta_max,20);

rj_CD0_nom=0.018;
rj_CD0_min=0.018*.9;
rj_CD0_max=0.018*1.1;
rj_CD0_vec=LinRange(rj_CD0_min,rj_CD0_max,20);

rj_AR_nom=12;
rj_AR_min=12*.9;
rj_AR_max=12*1.1;
rj_AR_vec=LinRange(rj_AR_min,rj_AR_max,20);

rj_loading_nom=400;
rj_loading_min=400*0.9;
rj_loading_max=400*1.1;
rj_loading_vec=LinRange(rj_loading_min,rj_loading_max,20);

rj_EWF_nom=0.4;
rj_EWF_min=0.4*.9;
rj_EWF_max=0.4*1.1;
rj_EWF_vec=LinRange(rj_EWF_min,rj_EWF_max,20);

rj_range=500;
rj_pax=60;
rj_MTOM=50000;


rj_change_eta=zeros(20,1);
rj_change_CD0=zeros(20,1);
rj_change_AR=zeros(20,1);
rj_change_loading=zeros(20,1);
rj_change_EWF=zeros(20,1);


for eta=1:20
        rj_change_eta[eta],x,y=SERP_sensitivity(rj_range,rj_pax,rj_MTOM,rj_CD0_nom,rj_AR_nom,rj_eta_vec[eta],rj_loading_nom,rj_EWF_nom);
    
end


for CD0=1:20
    rj_change_CD0[CD0],x,y=SERP_sensitivity(rj_range,rj_pax,rj_MTOM,rj_CD0_vec[CD0],rj_AR_nom,rj_eta_nom,rj_loading_nom,rj_EWF_nom);
    
end

for AR=1:20
    rj_change_AR[AR],x,y=SERP_sensitivity(rj_range,rj_pax,rj_MTOM,rj_CD0_nom,rj_AR_vec[AR],rj_eta_nom,rj_loading_nom,rj_EWF_nom);
    
end


for loading=1:20
    rj_change_loading[loading],x,y=SERP_sensitivity(rj_range,rj_pax,rj_MTOM,rj_CD0_nom,rj_AR_nom,rj_eta_nom,rj_loading_vec[loading],rj_EWF_nom);
    
end

for EWF=1:20
    rj_change_EWF[EWF],x,y=SERP_sensitivity(rj_range,rj_pax,rj_MTOM,rj_CD0_nom,rj_AR_nom,rj_eta_nom,rj_loading_nom,rj_EWF_vec[EWF]);
    
end

using Plots
plot(LinRange(-10,10,20),rj_change_eta,label="Efficiency",lw=3,xlabel="Percent Change From Nominal",ylabel="Specific Energy, Wh/Kg",guidefontsize=18,fontfamily="Times")
plot!(LinRange(-10,10,20),rj_change_CD0,label="CD0",lw=3)
plot!(LinRange(-10,10,20),rj_change_AR,label="AR",lw=3)
plot!(LinRange(-10,10,20),rj_change_loading,label="Loading",lw=3)
plot!(LinRange(-10,10,20),rj_change_EWF,label="EWF",lw=3)
savefig("RJ Sensitivity.png")













