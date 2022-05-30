include("includeme.jl")
include("sensitivity.jl")
wb_eta_nom=0.72;
wb_eta_min=.72*.9;
wb_eta_max=.72*1.1;
wb_eta_vec=LinRange(wb_eta_min,wb_eta_max,20);

wb_CD0_nom=0.018;
wb_CD0_min=0.018*.9;
wb_CD0_max=0.018*1.1;
wb_CD0_vec=LinRange(wb_CD0_min,wb_CD0_max,20);

wb_AR_nom=10;
wb_AR_min=10*.9;
wb_AR_max=10*1.1;
wb_AR_vec=LinRange(wb_AR_min,wb_AR_max,20);

wb_loading_nom=600;
wb_loading_min=600*0.9;
wb_loading_max=600*1.1;
wb_loading_vec=LinRange(wb_loading_min,wb_loading_max,20);

wb_EWF_nom=0.4;
wb_EWF_min=0.4*.9;
wb_EWF_max=0.4*1.1;
wb_EWF_vec=LinRange(wb_EWF_min,wb_EWF_max,20);

wb_range=2000;
wb_pax=300;
wb_MTOM=250000;


wb_change_eta=zeros(20,1);
wb_change_CD0=zeros(20,1);
wb_change_AR=zeros(20,1);
wb_change_loading=zeros(20,1);
wb_change_EWF=zeros(20,1);


for eta=1:20
        wb_change_eta[eta],x,y=SERP_sensitivity(wb_range,wb_pax,wb_MTOM,wb_CD0_nom,wb_AR_nom,wb_eta_vec[eta],wb_loading_nom,wb_EWF_nom);
    
end


for CD0=1:20
           wb_change_CD0[CD0],x,y=SERP_sensitivity(wb_range,wb_pax,wb_MTOM,wb_CD0_vec[CD0],wb_AR_nom,wb_eta_nom,wb_loading_nom,wb_EWF_nom);
    
end

for AR=1:20
    wb_change_AR[AR],x,y=SERP_sensitivity(wb_range,wb_pax,wb_MTOM,wb_CD0_nom,wb_AR_vec[AR],wb_eta_nom,wb_loading_nom,wb_EWF_nom);
    
end


for loading=1:20
    wb_change_loading[loading],x,y=SERP_sensitivity(wb_range,wb_pax,wb_MTOM,wb_CD0_nom,wb_AR_nom,wb_eta_nom,wb_loading_vec[loading],wb_EWF_nom);
    
end

for EWF=1:20
    wb_change_EWF[EWF],x,y=SERP_sensitivity(wb_range,wb_pax,wb_MTOM,wb_CD0_nom,wb_AR_nom,wb_eta_nom,wb_loading_nom,wb_EWF_vec[EWF]);
    
end

using Plots
plot(LinRange(-10,10,20),wb_change_eta,label="Efficiency",lw=3,xlabel="Percent Change From Nominal",ylabel="Specific Energy, Wh/Kg",guidefontsize=18,fontfamily="Times")
plot!(LinRange(-10,10,20),wb_change_CD0,label="CD0",lw=3)
plot!(LinRange(-10,10,20),wb_change_AR,label="AR",lw=3)
plot!(LinRange(-10,10,20),wb_change_loading,label="Loading",lw=3)
plot!(LinRange(-10,10,20),wb_change_EWF,label="EWF",lw=3)
savefig("WB Sensitivity.png")
