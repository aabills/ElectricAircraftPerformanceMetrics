include("includeme.jl")
include("sensitivity.jl")
nb_eta_nom=0.72;
nb_eta_min=.72*.9;
nb_eta_max=.72*1.1;
nb_eta_vec=LinRange(nb_eta_min,nb_eta_max,20);

nb_CD0_nom=0.018;
nb_CD0_min=0.018*.9;
nb_CD0_max=0.018*1.1;
nb_CD0_vec=LinRange(nb_CD0_min,nb_CD0_max,20);

nb_AR_nom=11;
nb_AR_min=11*.9;
nb_AR_max=11*1.1;
nb_AR_vec=LinRange(nb_AR_min,nb_AR_max,20);

nb_loading_nom=500;
nb_loading_min=500*0.9;
nb_loading_max=500*1.1;
nb_loading_vec=LinRange(nb_loading_min,nb_loading_max,20);

nb_EWF_nom=0.4;
nb_EWF_min=0.4*.9;
nb_EWF_max=0.4*1.1;
nb_EWF_vec=LinRange(nb_EWF_min,nb_EWF_max,20);

nb_range=750;
nb_pax=150;
nb_MTOM=100000;


nb_change_eta=zeros(20,1);
nb_change_CD0=zeros(20,1);
nb_change_AR=zeros(20,1);
nb_change_loading=zeros(20,1);
nb_change_EWF=zeros(20,1);


for eta=1:20
        nb_change_eta[eta],x,y=SERP_sensitivity(nb_range,nb_pax,nb_MTOM,nb_CD0_nom,nb_AR_nom,nb_eta_vec[eta],nb_loading_nom,nb_EWF_nom);
    
end


for CD0=1:20
           nb_change_CD0[CD0],x,y=SERP_sensitivity(nb_range,nb_pax,nb_MTOM,nb_CD0_vec[CD0],nb_AR_nom,nb_eta_nom,nb_loading_nom,nb_EWF_nom);
    
end

for AR=1:20
    nb_change_AR[AR],x,y=SERP_sensitivity(nb_range,nb_pax,nb_MTOM,nb_CD0_nom,nb_AR_vec[AR],nb_eta_nom,nb_loading_nom,nb_EWF_nom);
    
end


for loading=1:20
    nb_change_loading[loading],x,y=SERP_sensitivity(nb_range,nb_pax,nb_MTOM,nb_CD0_nom,nb_AR_nom,nb_eta_nom,nb_loading_vec[loading],nb_EWF_nom);
    
end

for EWF=1:20
    nb_change_EWF[EWF],x,y=SERP_sensitivity(nb_range,nb_pax,nb_MTOM,nb_CD0_nom,nb_AR_nom,nb_eta_nom,nb_loading_nom,nb_EWF_vec[EWF]);
    
end

using Plots
plot(LinRange(-10,10,20),nb_change_eta,label="Efficiency",lw=3,xlabel="Percent Change From Nominal",ylabel="Specific Energy, Wh/Kg",guidefontsize=18,fontfamily="Times")
plot!(LinRange(-10,10,20),nb_change_CD0,label="CD0",lw=3)
plot!(LinRange(-10,10,20),nb_change_AR,label="AR",lw=3)
plot!(LinRange(-10,10,20),nb_change_loading,label="Loading",lw=3)
plot!(LinRange(-10,10,20),nb_change_EWF,label="EWF",lw=3)
savefig("NB Sensitivity.png")
