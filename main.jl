#main airplane code
include("serieshybridjulia.jl")
include("missionjulia.jl")
include("raymerequations.jl")
include("flymission.jl")
include("SERP.jl")
include("range.jl")

r_out=zeros(21,41);
p_out=zeros(21,41);

for weight_fraction=0.35:.01:0.55
    for specific_energy=200:25:1200
   arr=zeros(1,200);
       range_out=zeros(1,200);
      for pax=1:100
             range_out[pax],airplane,mainMission,reserve=pnm_battweight(pax,50000,specific_energy,weight_fraction);
             range_out[pax]=range_out[pax]/1852;
            #if(range_out[pax]<=1000)
            #    range_out[pax]=0;
            #    break
            #end
             arr[Int(pax)]=(range_out[pax]-350)*(pax-30);
            if(pax<30||range_out[pax]<350)
                        arr[Int(pax)]=0;
                        range_out[pax]=0;
                    end
            if(pax>=2)
             if(arr[Int(pax)]<arr[Int(pax-1)])
                break
            end
            end
      end 
     wfi=Int(round(weight_fraction/.01))-34
     sei=Int(specific_energy/25)-7;
     println("Weight Fraction:")
     println(weight_fraction)
     println("Specific Energy:");
     println(specific_energy);
     num,ind=findmax(arr);
     r_out[wfi,sei]=range_out[ind];
     p_out[wfi,sei]=Int(ind[2]);
     println("Range: ")
     println(r_out[wfi,sei]);
     println("PAX: ");
     println(Int(ind[2]));
    end
end


wf=.35:.01:.55
se=200:25:1200

contourf(wf,se,p_out',contour_labels=true,xlabel="Empty Weight Fraction",ylabel="Specific Energy,Wh/Kg", guidefontsize=16,title="Passengers at Optimal PNMi",titlefontsize=18,fontfamily="Times",levels=30:10:100)
plot!([500,500],[.35,.55])
savefig("RJ Passengers.png")

contourf(wf,se,r_out',contour_labels=true,xlabel="Empty Weight Fraction",ylabel="Specific Energy,Wh/Kg", guidefontsize=16,title="Range at Optimal PNMi, NMi",titlefontsize=18,fontfamily="Times",levels=100:50:1000)
savefig("RJ Range.png")


r_out
p_out
      
    


