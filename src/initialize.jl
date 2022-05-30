function initialize()
batterydesign=DataFrame(CSV.read("batterydesign.csv"))
chem=DataFrame(CSV.read("chem.csv"))
components=DataFrame(CSV.read("components.csv"))
flowandsys=DataFrame(CSV.read("flowandsys.csv"))
iterativeiv=DataFrame(CSV.read("iterativeiv.csv"))
ivthickness=DataFrame(CSV.read("ivthickness.csv"))
return batterydesign, chem, components,flowandsys,iterativeiv,ivthickness
end