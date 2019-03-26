using CSV
using DataFrames
batterydesign=DataFrame(CSV.read("li_air_julia/batterydesign.csv"))
chem=DataFrame(CSV.read("li_air_julia/chem.csv"))
components=DataFrame(CSV.read("li_air_julia/components.csv"))
flowandsys=DataFrame(CSV.read("li_air_julia/flowandsys.csv"))
iterativeiv=DataFrame(CSV.read("li_air_julia/iterativeiv.csv"))
ivthickness=DataFrame(CSV.read("li_air_julia/ivthickness.csv"))
