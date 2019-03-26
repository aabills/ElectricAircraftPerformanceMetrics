# Address	Formula
## Iterative I-V
# iterativeiv.C[19]=0
# iterativeiv.C[20]=0

iterativeiv.C[3]	 =flowandsys.C[10]
iterativeiv.C[4]	 =flowandsys.C[28]
iterativeiv.C[2]	 =iterativeiv.C[9]/(iterativeiv.C[10]*iterativeiv.C[11])
iterativeiv.C[5]	 =iterativeiv.C[14]*iterativeiv.C[9]*iterativeiv.C[6]*iterativeiv.C[12]/1000
if iterativeiv.C[19]==1
    iterativeiv.C[7]	 = iterativeiv.C[3]*1000/(iterativeiv.C[17]/1000*iterativeiv.P[15])/10000
else()
    iterativeiv.C[7]	 = iterativeiv.C[3]*1000/(iterativeiv.C[17]/1000*iterativeiv.C[8]*0.9)/10000
end
# iterativeiv.C[7]	 =IF[iterativeiv.C[19]=1,iterativeiv.C[3]*1000/(iterativeiv.C[17]/1000*iterativeiv.P[15])/10000,iterativeiv.C[3]*1000/(iterativeiv.C[17]/1000*iterativeiv.C[8]*0.9)/10000]
iterativeiv.C[8]	 =chem.E[49]
iterativeiv.C[9]	 =iterativeiv.C[7]*10000/iterativeiv.C[6]
println(iterativeiv.C[9]/500)
iterativeiv.C[10]	 =even(iterativeiv.C[9]/500)
if abs(iterativeiv.C[9]-6000)>100
    if abs(iterativeiv.C[9]-4000)>100
    iterativeiv.C[11]	 = iterativeiv.C[9]/iterativeiv.C[10]
    else()
    iterativeiv.C[11]	 =250
    end
end
# iterativeiv.C[11]	 =IF[AND[abs(iterativeiv.C[9]-6000)>100,abs(iterativeiv.C[9]-4000)>100],iterativeiv.C[9]/iterativeiv.C[10],250]
iterativeiv.C[12]	 =0.8*iterativeiv.C[8]
iterativeiv.C[13]	 =iterativeiv.C[8]-iterativeiv.C[84]
iterativeiv.C[14]	 =iterativeiv.C[15]
if iterativeiv.C[19]==1
    iterativeiv.C[15]	 =(iterativeiv.C[13]-iterativeiv.C[12])*0.01+iterativeiv.C[14]
else()
    iterativeiv.C[15]	 =0.02
end
# iterativeiv.C[15]	 =IF[iterativeiv.C[19]=1,(iterativeiv.C[13]-iterativeiv.C[12])*0.01+iterativeiv.C[14],0.02]
iterativeiv.C[16]	 =iterativeiv.C[17]/1000/5
if iterativeiv.C[19]==1
iterativeiv.C[17]	 =iterativeiv.C[14]*1000/((iterativeiv.C[4]*1000/(iterativeiv.C[6]*iterativeiv.C[12])/(iterativeiv.C[3]*1000/(iterativeiv.C[6]*iterativeiv.P[15]))))
else()
    iterativeiv.C[17]	 =iterativeiv.C[14]*1000/((iterativeiv.C[4]*1000/(iterativeiv.C[6]*iterativeiv.C[12])/(iterativeiv.C[3]*1000/(iterativeiv.C[6]*iterativeiv.C[12]))))
end
# iterativeiv.C[17]	 =IF[iterativeiv.C[19]=1,iterativeiv.C[14]*1000/((iterativeiv.C[4]*1000/(iterativeiv.C[6]*iterativeiv.C[12])/(iterativeiv.C[3]*1000/(iterativeiv.C[6]*iterativeiv.P[15])))),iterativeiv.C[14]*1000/((iterativeiv.C[4]*1000/(iterativeiv.C[6]*iterativeiv.C[12])/(iterativeiv.C[3]*1000/(iterativeiv.C[6]*iterativeiv.C[12]))))]
iterativeiv.C[18]	 =iterativeiv.C[3]*1000/(iterativeiv.C[144]*iterativeiv.C[8])/iterativeiv.C[6]
if iterativeiv.C[67]<3.1
    if iterativeiv.C[67]>0.01
        if flowandsys.C[44]<0
            println("reset flow()")
        else()
            println("Chill Maaadi")
        end
    else()
        println("reset positive")
    end
end        
# iterativeiv.C[21]	 =IF[AND[iterativeiv.C[67]<3.1,iterativeiv.C[67]>0.01],IF[flowandsys.C[44]<0,"reset flow()",""],"reset positive"]
iterativeiv.C[29]	 =chem.E[24]
iterativeiv.C[30]	 =iterativeiv.C[17]/batterydesign.F[41]/1000*iterativeiv.C[29]
iterativeiv.C[34]	 =8.31443*303/(iterativeiv.C[33]*96485.3)*asinh(iterativeiv.C[14]/(2*iterativeiv.C[32]))
iterativeiv.C[35]	 =iterativeiv.C[34]/iterativeiv.C[14]
iterativeiv.C[38]	 =chem.E[43]*10^-4
iterativeiv.C[40]	 =iterativeiv.C[41]*iterativeiv.C[14]
iterativeiv.C[41]	 =iterativeiv.C[38]/iterativeiv.C[39]
iterativeiv.C[45]	 =iterativeiv.C[32]
iterativeiv.C[47]	 =8.31443*303/(iterativeiv.C[46]*96485.3)*asinh(iterativeiv.C[14]/(2*iterativeiv.C[45]))
iterativeiv.C[48]	 =iterativeiv.C[47]/iterativeiv.C[14]
iterativeiv.C[51]	 =chem.E[7]*chem.E[20]
iterativeiv.C[53]	 =chem.E[18]/100
iterativeiv.C[54]	 =(chem.E[10]+chem.E[11])/100
iterativeiv.C[55]	 =iterativeiv.C[17]/iterativeiv.C[51]/iterativeiv.C[52]
iterativeiv.C[57]	 =iterativeiv.C[56]*iterativeiv.C[55]
iterativeiv.C[58]	 =chem.E[51]*iterativeiv.C[53]^1.5
iterativeiv.C[59]	 =100*iterativeiv.C[54]^1.5
if abs(iterativeiv.C[14])>iterativeiv.C[56]*iterativeiv.C[62]*iterativeiv.C[55]
    println("Design iter: Using Tafel w. Newman and Tobais expression")
else()
    println("Design iter: Using Linear Kinetics w. Euler and Nonnenmacher expression")
end
# iterativeiv.C[60]	 =IF[abs(iterativeiv.C[14])>iterativeiv.C[56]*iterativeiv.C[62]*iterativeiv.C[55],"Use Tafel", "Use Linear"]
iterativeiv.C[62]	 =0.00001
iterativeiv.C[64]	 =(1-iterativeiv.C[63])*96485.3/303/8.31443
iterativeiv.C[65]	 =iterativeiv.C[55]*abs(iterativeiv.C[14])*iterativeiv.C[64]*(1/iterativeiv.C[58]+1/iterativeiv.C[59])
iterativeiv.C[66]	 =iterativeiv.C[55]*abs(iterativeiv.C[14])*iterativeiv.C[64]/iterativeiv.C[58]
if iterativeiv.C[65]>19.2
if iterativeiv.C[20]==1
       iterativeiv.C[67] = atan((iterativeiv.C[69]-iterativeiv.C[68])*0.1+iterativeiv.C[68])+pi
   else()
       iterativeiv.C[67] = 1.58
end
end
if iterativeiv.C[65]<=19.2
if iterativeiv.C[20]==1
      iterativeiv.C[67] = atan((iterativeiv.C[69]-iterativeiv.C[68])*0.1+iterativeiv.C[68])
    else()
       iterativeiv.C[67] =  1.565
end
end

# iterativeiv.C[67]	 =IF[iterativeiv.C[65]>19.2,IF[iterativeiv.C[20]=1,atan((iterativeiv.C[69]-iterativeiv.C[68])*0.1+iterativeiv.C[68])+pi,1.58],IF[iterativeiv.C[20]=1,atan((iterativeiv.C[69]-iterativeiv.C[68])*0.1+iterativeiv.C[68]),1.565]]
iterativeiv.C[68]	 =tan(iterativeiv.C[67])
iterativeiv.C[69]	 =2*iterativeiv.C[65]*iterativeiv.C[67]/(4*iterativeiv.C[67]^2-iterativeiv.C[66]*(iterativeiv.C[65]-iterativeiv.C[66]))
iterativeiv.C[70]	 =atan(iterativeiv.C[66]/(2*iterativeiv.C[67]))
iterativeiv.C[71]	 =((iterativeiv.C[65]-iterativeiv.C[66])*(iterativeiv.C[66]/iterativeiv.C[65]+2/iterativeiv.C[65]*log(1/cos(iterativeiv.C[67]-iterativeiv.C[70])))+2*iterativeiv.C[66]/iterativeiv.C[65]*log(1/cos(iterativeiv.C[70]))+log(2*abs(iterativeiv.C[14])*iterativeiv.C[67]^2/(iterativeiv.C[56]*iterativeiv.C[62]*iterativeiv.C[55]*iterativeiv.C[65])))/iterativeiv.C[64]
# iterativeiv.P[67]	 =IF[iterativeiv.P[65]>19.2,IF[iterativeiv.P[20]=1,atan((iterativeiv.P[69]-iterativeiv.P[68])*0.1+iterativeiv.P[68])+pi,1.8],IF[iterativeiv.P[20]=1,atan((iterativeiv.P[69]-iterativeiv.P[68])*0.1+iterativeiv.P[68]),1.565]]
iterativeiv.C[73]	 =sqrt((2*iterativeiv.C[63])*96495.3/8.31443/303*iterativeiv.C[56]*iterativeiv.C[62]*iterativeiv.C[55]^2*(1/iterativeiv.C[58]+1/iterativeiv.C[59]))
iterativeiv.C[74]	 =iterativeiv.C[14]*iterativeiv.C[55]/(iterativeiv.C[58]+iterativeiv.C[59])*(1+(2+(iterativeiv.C[59]/iterativeiv.C[58]+iterativeiv.C[58]/iterativeiv.C[59])*cosh(iterativeiv.C[73]))/(iterativeiv.C[73]*sinh(iterativeiv.C[73])))
# 
if abs(iterativeiv.C[14])>iterativeiv.C[56]*iterativeiv.C[62]*iterativeiv.C[55]
iterativeiv.C[75]	 =iterativeiv.C[71]/iterativeiv.C[14]
else()
    iterativeiv.C[75]	 =iterativeiv.C[74]/iterativeiv.C[14]
end
# iterativeiv.C[75]	 =IF[iterativeiv.C[60]="Use Tafel",iterativeiv.C[71]/iterativeiv.C[14],iterativeiv.C[74]/iterativeiv.C[14]]
iterativeiv.C[79]	 =iterativeiv.C[80]*iterativeiv.C[14]
iterativeiv.C[80]	 =batterydesign.F[87]
iterativeiv.C[83]	 =iterativeiv.C[80]+iterativeiv.C[75]+iterativeiv.C[48]+iterativeiv.C[41]+iterativeiv.C[35];#+iterativeiv.C[26]
iterativeiv.C[84]	 =iterativeiv.C[83]*iterativeiv.C[14]
iterativeiv.C[88]	 =ivthickness.C[88]
iterativeiv.C[89]	 =ivthickness.C[89]
iterativeiv.C[90]	 =ivthickness.C[90]
iterativeiv.C[91]	 =ivthickness.C[91]
iterativeiv.C[92]	 =ivthickness.C[92]
iterativeiv.C[93]	 =ivthickness.C[93]
iterativeiv.C[94]	 =ivthickness.C[94]
iterativeiv.C[122]	 =batterydesign.F[39]
iterativeiv.C[123]	 =batterydesign.F[41]
iterativeiv.C[124]	 =batterydesign.F[42]
iterativeiv.C[125]	 =batterydesign.F[48]
iterativeiv.C[129]	 =batterydesign.F[91]
iterativeiv.C[130]	 =iterativeiv.C[17]/1000/iterativeiv.C[122]*10000
iterativeiv.C[131]	 =iterativeiv.C[130]*iterativeiv.C[129]
# 
if iterativeiv.C[130]>iterativeiv.C[125]
    iterativeiv.C[132]	 =iterativeiv.C[125]
else()
    iterativeiv.C[132]	 =iterativeiv.C[130]
end
# iterativeiv.C[132]	 =IF[iterativeiv.C[130]>iterativeiv.C[125],iterativeiv.C[125],iterativeiv.C[130]]
iterativeiv.C[133]	 =iterativeiv.C[132]*iterativeiv.C[129]
iterativeiv.C[134]	 =iterativeiv.C[18]/(iterativeiv.C[132]/10000*iterativeiv.C[122])
iterativeiv.C[135]	 =iterativeiv.C[134]/iterativeiv.C[136]
iterativeiv.C[136]	 =even(iterativeiv.C[134]/500)
iterativeiv.C[137]	 =iterativeiv.C[134]*iterativeiv.C[6]/10000
iterativeiv.C[138]	 =ivthickness.C[14]
iterativeiv.C[139]	 =ivthickness.C[12]
iterativeiv.C[140]	 =ivthickness.P[15]
iterativeiv.C[141]	 =ivthickness.C[83]
iterativeiv.C[142]	 =ivthickness.P[83]
iterativeiv.C[143]	 =iterativeiv.C[139]/iterativeiv.C[8]
iterativeiv.C[144]	 =iterativeiv.C[140]/iterativeiv.C[8]
# 
if abs(iterativeiv.C[134]-iterativeiv.C[9])<0.001
    if abs(iterativeiv.C[141]-iterativeiv.C[83])<0.001
        if abs(iterativeiv.C[142]-iterativeiv.P[83])<0.001
            println("Okay your are NOT thickness limited")
        else()
            println("You are thickness limited")
        end
    end
end
# iterativeiv.C[145]	 =IF[AND[abs(iterativeiv.C[134]-iterativeiv.C[9])<0.001,abs(iterativeiv.C[141]-iterativeiv.C[83])<0.001,abs(iterativeiv.C[142]-iterativeiv.P[83])<0.001],"OK","THICKNESS-LIM"]
iterativeiv.P[30]	 =iterativeiv.C[30]
iterativeiv.P[3]	 =iterativeiv.C[3]
iterativeiv.P[4]	 =iterativeiv.C[4]
iterativeiv.P[6]	 =iterativeiv.C[6]
iterativeiv.P[7]	 =iterativeiv.C[7]
iterativeiv.P[8]	 =iterativeiv.C[8]
iterativeiv.P[9]	 =iterativeiv.C[9]
iterativeiv.P[10]	 =iterativeiv.C[10]
iterativeiv.P[11]	 =iterativeiv.C[11]
iterativeiv.P[12]	 =iterativeiv.C[12]
iterativeiv.P[14]	 =iterativeiv.P[15]/iterativeiv.P[8]
iterativeiv.P[15]	 =iterativeiv.P[8]-iterativeiv.P[84]
iterativeiv.P[16]	 =iterativeiv.C[16]
iterativeiv.P[17]	 =iterativeiv.C[17]
iterativeiv.P[18]	 =iterativeiv.C[18]
iterativeiv.P[20]	 =iterativeiv.C[20]
if iterativeiv.P[67]<3.1
    if iterativeiv.P[67]>0.1
        println("Chill Maaadi")
    end
else()
    println("reset positive")
end
# iterativeiv.P[21]	 =IF[AND[iterativeiv.P[67]<3.1,iterativeiv.P[67]>0.1],"","reset positive"]
iterativeiv.P[32]	 =iterativeiv.C[32]
iterativeiv.P[33]	 =iterativeiv.C[33]
iterativeiv.P[34]	 =8.31443*303/(iterativeiv.P[33]*96485.3)*asinh(iterativeiv.P[16]/(2*iterativeiv.P[32]))
iterativeiv.P[35]	 =iterativeiv.P[34]/iterativeiv.P[16]
iterativeiv.P[38]	 =iterativeiv.C[38]
iterativeiv.P[39]	 =iterativeiv.C[39]
iterativeiv.P[40]	 =iterativeiv.P[41]*iterativeiv.P[16]
iterativeiv.P[41]	 =iterativeiv.P[38]/iterativeiv.P[39]
iterativeiv.P[45]	 =iterativeiv.C[45]
iterativeiv.P[46]	 =iterativeiv.C[46]
iterativeiv.P[47]	 =8.31443*303/(iterativeiv.P[46]*96485.3)*asinh(iterativeiv.P[16]/(2*iterativeiv.P[45]))
iterativeiv.P[48]	 =iterativeiv.P[47]/iterativeiv.P[16]
iterativeiv.P[51]	 =iterativeiv.C[51]
iterativeiv.P[52]	 =iterativeiv.C[52]
iterativeiv.P[53]	 =iterativeiv.C[53]
iterativeiv.P[54]	 =iterativeiv.C[54]
iterativeiv.P[55]	 =iterativeiv.C[55]
iterativeiv.P[56]	 =iterativeiv.C[56]
iterativeiv.P[57]	 =iterativeiv.C[57]
iterativeiv.P[58]	 =iterativeiv.C[58]
iterativeiv.P[59]	 =iterativeiv.C[59]
if abs(iterativeiv.P[16])>iterativeiv.P[56]*iterativeiv.P[62]*iterativeiv.P[55]
    println("Energy iter: Using Tafel w. Newman and Tobais expression")
else()
    println("Energy iter: Using Linear Kinetics w. Euler and Nonnenmacher expression")
end 
# iterativeiv.P[60]	 =IF[abs(iterativeiv.P[16])>iterativeiv.P[56]*iterativeiv.P[62]*iterativeiv.P[55],"Use Tafel", "Use Linear"]
iterativeiv.P[62]	 =iterativeiv.C[62]
iterativeiv.P[63]	 =iterativeiv.C[63]
iterativeiv.P[64]	 =iterativeiv.C[64]
iterativeiv.P[65]	 =iterativeiv.P[55]*abs(iterativeiv.P[16])*iterativeiv.P[64]*(1/iterativeiv.P[58]+1/iterativeiv.P[59])
iterativeiv.P[66]	 =iterativeiv.P[55]*abs(iterativeiv.P[16])*iterativeiv.P[64]/iterativeiv.P[58]
if iterativeiv.P[65]>19.2
if iterativeiv.P[20]==1
       iterativeiv.P[67] = atan((iterativeiv.P[69]-iterativeiv.P[68])*0.1+iterativeiv.P[68])+pi
   else()
       iterativeiv.P[67] = 1.8
end
end
if iterativeiv.P[65]<=19.2
if iterativeiv.P[20]==1
      iterativeiv.P[67] = atan((iterativeiv.P[69]-iterativeiv.P[68])*0.1+iterativeiv.P[68])
    else()
       iterativeiv.P[67] =  1.565
end
end 
iterativeiv.P[68]	 =tan(iterativeiv.P[67])
iterativeiv.P[69]	 =2*iterativeiv.P[65]*iterativeiv.P[67]/(4*iterativeiv.P[67]^2-iterativeiv.P[66]*(iterativeiv.P[65]-iterativeiv.P[66]))
iterativeiv.P[70]	 =atan(iterativeiv.P[66]/(2*iterativeiv.P[67]))
iterativeiv.P[71]	 =((iterativeiv.P[65]-iterativeiv.P[66])*(iterativeiv.P[66]/iterativeiv.P[65]+2/iterativeiv.P[65]*log(1/cos(iterativeiv.P[67]-iterativeiv.P[70])))+2*iterativeiv.P[66]/iterativeiv.P[65]*log(1/cos(iterativeiv.P[70]))+log(2*abs(iterativeiv.P[16])*iterativeiv.P[67]^2/(iterativeiv.P[56]*iterativeiv.P[62]*iterativeiv.P[55]*iterativeiv.P[65])))/iterativeiv.P[64]
iterativeiv.P[73]	 =sqrt((2*iterativeiv.P[63])*96495.3/8.31443/303*iterativeiv.P[56]*iterativeiv.P[62]*iterativeiv.P[55]^2*(1/iterativeiv.P[58]+1/iterativeiv.P[59]))
iterativeiv.P[74]	 =iterativeiv.P[16]*iterativeiv.P[55]/(iterativeiv.P[58]+iterativeiv.P[59])*(1+(2+(iterativeiv.P[59]/iterativeiv.P[58]+iterativeiv.P[58]/iterativeiv.P[59])*cosh(iterativeiv.P[73]))/(iterativeiv.P[73]*sinh(iterativeiv.P[73])))
# 
if abs(iterativeiv.P[16])>iterativeiv.P[56]*iterativeiv.P[62]*iterativeiv.P[55]
  iterativeiv.P[75]	 =  iterativeiv.P[71]/iterativeiv.P[16]
else()
  iterativeiv.P[75]	 =  iterativeiv.P[74]/iterativeiv.P[16]
end
# iterativeiv.P[75]	 =IF[iterativeiv.P[60]="Use Tafel",iterativeiv.P[71]/iterativeiv.P[16],iterativeiv.P[74]/iterativeiv.P[16]]
iterativeiv.P[79]	 =iterativeiv.P[80]*iterativeiv.P[16]
iterativeiv.P[80]	 =iterativeiv.C[80]
iterativeiv.P[83]	 =iterativeiv.P[80]+iterativeiv.P[75]+iterativeiv.P[48]+iterativeiv.P[41]+iterativeiv.P[35];#+iterativeiv.P[26]
iterativeiv.P[84]	 =iterativeiv.P[83]*iterativeiv.P[16]