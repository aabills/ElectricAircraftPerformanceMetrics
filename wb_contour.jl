#Wide Body
using DelimitedFiles
include("airplane_header.jl");
r_out_wb=zeros(21,41);
p_out_wb=zeros(21,41);






for weight_fraction=0.35:.01:0.55
    for specific_energy=200:50:2200
   arr=zeros(1,300);
   range_out=zeros(1,300);
   for pax=1:300
             range_out[pax],airplane,mainMission,reserve=pnm_battweight(pax,250000,specific_energy,weight_fraction);
             range_out[pax]=range_out[pax]/1852;
            #if(range_out[pax]<=1000)
            #    range_out[pax]=0;
            #    break
            #end
             arr[Int(pax)]=(range_out[pax]-1000)*(pax-150);
            if(pax<150||range_out[pax]<1000)
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
     sei=Int(specific_energy/50)-3;
     println("Weight Fraction:")
     println(weight_fraction)
     println("Specific Energy:");
     println(specific_energy);
     num,ind=findmax(arr);
     r_out_wb[wfi,sei]=range_out[ind];
     p_out_wb[wfi,sei]=Int(ind[2]);
     println("Range: ")
     println(r_out_wb[wfi,sei]);
     println("PAX: ");
     println(Int(ind[2]));
    end
end

open("Data/WB_PAX.csv","w") do io
    writedlm(io,p_out_wb,',');
end
    
open("Data/WB_RANGE.csv","w") do io
    writedlm(io,r_out_wb,',');
end
