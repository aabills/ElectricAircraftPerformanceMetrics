using ElectricAircraftPerformanceMetrics, DelimitedFiles, Printf
batterydesign, chem, components,flowandsys,iterativeiv,ivthickness=ElectricAircraftPerformanceMetrics.initialize()
max_iter=4
for n=1:max_iter
    ElectricAircraftPerformanceMetrics.flowandsys_new(flowandsys,iterativeiv)
    ElectricAircraftPerformanceMetrics.iterativeiv_new(iterativeiv,flowandsys)
    ElectricAircraftPerformanceMetrics.ivthickness_new(ivthickness,flowandsys,iterativeiv)
    ElectricAircraftPerformanceMetrics.batterydesign_new(batterydesign,chem,iterativeiv,flowandsys)
end

@printf("Power, [kW]: %f\n",batterydesign.F[200])
@printf("Energy, [kWh]: %f\n",batterydesign.F[201])
@printf("Usable Energy, [kWh] %f\n" ,batterydesign.F[202])
@printf("Gravimetric Energy Density, [Wh/kg] %f\n",batterydesign.F[213])
@printf("Volumetric Energy Density, [Wh/L] %f\n",batterydesign.F[214])