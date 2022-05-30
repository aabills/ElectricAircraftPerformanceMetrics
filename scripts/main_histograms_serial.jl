using ElectricAircraftPerformanceMetrics
using DelimitedFiles
using Printf
num_sims=100000
SE_RJ=zeros(num_sims)
SE_NB=zeros(num_sims)
SE_WB=zeros(num_sims)

@time for n=1:num_sims
    SE_RJ[n]=ElectricAircraftPerformanceMetrics.SERP_Distributions(350,75,50000)
    SE_NB[n]=ElectricAircraftPerformanceMetrics.SERP_Distributions(500,150,100000)
    SE_WB[n]=ElectricAircraftPerformanceMetrics.SERP_Distributions(1000,200,250000)
    if(n%100==0)
    @printf("Iteration: %f  RJSE: %f  NBSE: %f  WBSE: %f\n",n,SE_RJ[n],SE_NB[n],SE_WB[n]); 
    end
end

open("Data/RJ_HISTOGRAM.csv","w") do io
    writedlm(io,SE_RJ,',');
end
open("Data/NB_HISTOGRAM.csv","w") do io
    writedlm(io,SE_NB,',');
end
open("Data/WB_HISTOGRAM.csv","w") do io
    writedlm(io,SE_WB,',');
end
