module ElectricAircraftPerformanceMetrics
#Airplane Source Code
using SpecialFunctions
using DelimitedFiles
include("missionjulia.jl")
include("SERP.jl")
include("serieshybridjulia.jl")
include("flyMission.jl")
include("range.jl")
include("raymerequations.jl")
include("airplanestats.jl")

#Li-Air Source Code
using CSV
using DataFrames
using Printf
include("initialize.jl")
include("even.jl")
include("odd.jl")
include("ivthickness_new.jl")
include("iterativeiv_new.jl")
include("flowandsys_new.jl")
include("batterydesign_new.jl")


export SERP
end