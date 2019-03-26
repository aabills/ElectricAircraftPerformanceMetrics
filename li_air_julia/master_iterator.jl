
batterydesign, chem, components,flowandsys,iterativeiv,ivthickness=initialize()
max_iter=4
for n=1:max_iter
    flowandsys_new(flowandsys,iterativeiv)
    iterativeiv_new(iterativeiv,flowandsys)
    ivthickness_new(ivthickness,flowandsys,iterativeiv)
    batterydesign_new(batterydesign,chem,iterativeiv,flowandsys)
end

@printf("Power, [kW]: %f\n",batterydesign.F[200])
@printf("Energy, [kWh]: %f\n",batterydesign.F[201])
@printf("Usable Energy, [kWh] %f\n" ,batterydesign.F[202])
@printf("Gravimetric Energy Density, [Wh/kg] %f\n",batterydesign.F[213])
@printf("Volumetric Energy Density, [Wh/L] %f\n",batterydesign.F[214])