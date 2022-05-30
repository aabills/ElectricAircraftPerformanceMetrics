#Power Profile Main    
using ElectricAircraftPerformanceMetrics
using DelimitedFiles


a,b,rj=ElectricAircraftPerformanceMetrics.SERP(350,75,50000)
a,b,nb=ElectricAircraftPerformanceMetrics.SERP(500,150,100000)
a,b,wb=ElectricAircraftPerformanceMetrics.SERP(2000,250,250000)

open("Data/misra/RJ_PowerProfile.csv","w") do io
    writedlm(io,rj.powerProfile,',');
end
open("Data/misra/RJ_VelocityProfile.csv","w") do io
    writedlm(io,rj.velocityProfile,',');
end
open("Data/misra/RJ_AltitudeProfile.csv","w") do io
    writedlm(io,rj.altitudeProfile,',');
end

open("Data/misra/NB_PowerProfile.csv","w") do io
    writedlm(io,nb.powerProfile,',');
end
open("Data/misra/NB_VelocityProfile.csv","w") do io
    writedlm(io,nb.velocityProfile,',');
end
open("Data/misra/NB_AltitudeProfile.csv","w") do io
    writedlm(io,nb.altitudeProfile,',');
end


open("Data/misra/WB_PowerProfile.csv","w") do io
    writedlm(io,wb.powerProfile,',');
end
open("Data/misra/WB_VelocityProfile.csv","w") do io
    writedlm(io,wb.velocityProfile,',');
end
open("Data/misra/WB_AltitudeProfile.csv","w") do io
    writedlm(io,wb.altitudeProfile,',');
end