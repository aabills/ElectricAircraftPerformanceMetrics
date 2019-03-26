
include("importdata.jl")
include("even.jl")
include("odd.jl")
max_iter=4
for n=1:max_iter
    include("flowandsys_new.jl")
    include("iterativeiv_new.jl")
    include("ivthickness_new.jl")
    include("batterydesign_new.jl")
end
using Printf
@printf("Power, [kW]: %f\n",batterydesign.F[200])
@printf("Energy, [kWh]: %f\n",batterydesign.F[201])
@printf("Usable Energy, [kWh] %f\n" ,batterydesign.F[202])
@printf("Gravimetric Energy Density, [Wh/kg] %f\n",batterydesign.F[213])
@printf("Volumetric Energy Density, [Wh/L] %f\n",batterydesign.F[214])