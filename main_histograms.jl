include("airplane_header.jl")
using DelimitedFiles
num_sims=100000
SE_RJ=zeros(num_sims)
SE_NB=zeros(num_sims)
SE_WB=zeros(num_sims)

for n=1:num_sims
    SE_RJ[n]=SERP_Distributions(350,75,50000)
    SE_NB[n]=SERP_Distributions(500,150,100000)
    SE_WB[n]=SERP_Distributions(2000,300,250000)
end

open("RJ_HISTOGRAM.csv","w") do io
    writedlm(io,SE_RJ,',');
end
open("NB_HISTOGRAM.csv","w") do io
    writedlm(io,SE_NB,',');
end
open("WB_HISTOGRAM.csv","w") do io
    writedlm(io,SE_WB,',');
end
