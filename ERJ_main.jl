#main_ERJ_histogram
@everywhere include("airplane_header.jl")
using DelimitedFiles
using SharedArrays
@everywhere using Printf

num_sims=10000
num_mass_points = 100

low_mass=50000
high_mass=74999


mass_vec = range(low_mass,stop=high_mass,length=num_mass_points)

SE_ERJ=SharedArray{Float64,1}(num_sims,num_mass_points)

shape = 1.98
scale = 308.41
offset = 433.55

@sync @distributed for i=1:num_sims
    for j = 1:num_mass_points
        MTOM = mass_vec[j]
        range = (offset+rand(gamma(shape,scale)))/1.852
        SE_ERJ[n]=SERP_Distributions(range,107,MTOM)
    if(n%100==0)
    @printf("Iteration: %f  NBSE: %f  WBSE: %f\n",n,SE_NB[n],SE_WB[n]);
    end
end

open("ERJ_HISTOGRAM.csv","w") do io
    writedlm(io,SE_ERJ,',');
end
