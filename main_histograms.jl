@everywhere include("airplane_header.jl")
using DelimitedFiles
using SharedArrays
@everywhere using Printf
num_sims=100000
SE_RJ=SharedArray{Float64,1}(num_sims)
SE_NB=SharedArray{Float64,1}(num_sims)
SE_WB=SharedArray{Float64,1}(num_sims)

@time @sync @distributed for n=1:num_sims
    # SE_RJ[n]=SERP_Distributions(350,75,50000)
    SE_NB[n]=SERP_Distributions(1000,150,100000)
    SE_WB[n]=SERP_Distributions(1000,200,250000)
    if(n%100==0)
    @printf("Iteration: %f  NBSE: %f  WBSE: %f\n",n,SE_NB[n],SE_WB[n]); 
    end
end

#open("RJ_HISTOGRAM.csv","w") do io
 #   writedlm(io,SE_RJ,',');
#end
open("NB_HISTOGRAM_NBWBSAMERANGE.csv","w") do io
    writedlm(io,SE_NB,',');
end
open("WB_HISTOGRAM_NBWBSAMERANGE.csv","w") do io
    writedlm(io,SE_WB,',');
end
