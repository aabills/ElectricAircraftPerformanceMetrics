# Address	Formula
## IV Thickness
ivthickness.P[3]	 =ivthickness.C[3]
ivthickness.P[4]	 =ivthickness.C[4]
ivthickness.C[2]	 =ivthickness.C[9]/(ivthickness.C[10]*ivthickness.C[11])
ivthickness.C[3]	 =iterativeiv.C[3]
ivthickness.C[4]	 =iterativeiv.C[4]
ivthickness.C[5]	 =iterativeiv.C[5]
ivthickness.C[6]	 =iterativeiv.C[6]
ivthickness.C[7]	 =iterativeiv.C[137]
ivthickness.C[8]	 =iterativeiv.C[8]
ivthickness.C[9]	 =iterativeiv.C[134]
ivthickness.C[10]	 =iterativeiv.C[136]
ivthickness.C[11]	 =iterativeiv.C[135]
ivthickness.C[12]	 =ivthickness.C[8]-ivthickness.C[84]
if ivthickness.C[19]==1
    ivthickness.C[14]	 = ivthickness.C[15]
else()
    ivthickness.C[14]	 = 0.05
end
# ivthickness.C[14]	 =IF[ivthickness.C[19]=1,ivthickness.C[15],0.05]
ivthickness.C[15]	 =ivthickness.C[4]*1000/(ivthickness.C[6]*ivthickness.C[9]*ivthickness.C[12])
ivthickness.C[16]	 =ivthickness.C[17]/1000/5
ivthickness.C[17]	 =ivthickness.C[18]/ivthickness.C[9]*1000
ivthickness.C[18]	 =iterativeiv.C[18]
ivthickness.P[6]	 =ivthickness.C[6]
ivthickness.P[7]	 =ivthickness.C[7]
ivthickness.P[8]	 =ivthickness.C[8]
ivthickness.P[9]	 =ivthickness.C[9]
ivthickness.P[10]	 =ivthickness.C[10]
ivthickness.P[11]	 =ivthickness.C[11]
ivthickness.P[12]	 =ivthickness.C[12]
ivthickness.P[13]	 =ivthickness.C[3]*1000/(ivthickness.C[6]*ivthickness.C[18])
ivthickness.P[14]	 =ivthickness.P[15]/ivthickness.P[8]
ivthickness.P[15]	 =ivthickness.P[8]-ivthickness.P[84]
ivthickness.P[16]	 =ivthickness.C[16]
ivthickness.P[17]	 =ivthickness.C[17]
ivthickness.P[18]	 =ivthickness.C[18]
if ivthickness.C[67]<3.1
    if ivthickness.C[67]>0.01
        if flowandsys.C[44]<0
            println("reset flow()")
        else() 
            println("chill maadi")
        end
    end
else()
    println("reset positive")
end
# ivthickness.C[21]	 =IF[AND[ivthickness.C[67]<3.1,ivthickness.C[67]>0.01],IF[flowandsys.C[44]<0,"reset flow()",""],"reset positive"]
if ivthickness.P[67]<3.1
    if ivthickness.P[67]>0.1
        println("chill maadi")
    end
else()
    println("reset positive")
end
# ivthickness.P[21]	 =IF[AND[ivthickness.P[67]<3.1,ivthickness.P[67]>0.1],"","reset positive"]
ivthickness.C[29]	 =chem.E[24]
ivthickness.C[30]	 =iterativeiv.C[133]/10000
ivthickness.P[29]	 =ivthickness.C[29]
ivthickness.P[30]	 =ivthickness.C[30]
ivthickness.C[32]	 =iterativeiv.C[32]
ivthickness.C[33]	 =iterativeiv.C[33]
ivthickness.C[34]	 =8.31443*303/(ivthickness.C[33]*96485.3)*asinh(ivthickness.C[14]/(2*ivthickness.C[32]))
ivthickness.C[35]	 =ivthickness.C[34]/ivthickness.C[14]
ivthickness.P[32]	 =ivthickness.C[32]
ivthickness.P[33]	 =ivthickness.C[33]
ivthickness.P[34]	 =8.31443*303/(ivthickness.P[33]*96485.3)*asinh(ivthickness.P[16]/(2*ivthickness.P[32]))
ivthickness.P[35]	 =ivthickness.P[34]/ivthickness.P[16]
ivthickness.C[38]	 =chem.E[43]*10^-4
ivthickness.C[39]	 =iterativeiv.C[39]
ivthickness.C[40]	 =ivthickness.C[41]*ivthickness.C[14]
ivthickness.C[41]	 =ivthickness.C[38]/ivthickness.C[39]
ivthickness.P[38]	 =ivthickness.C[38]
ivthickness.P[39]	 =ivthickness.C[39]
ivthickness.P[40]	 =ivthickness.P[41]*ivthickness.P[16]
ivthickness.P[41]	 =ivthickness.P[38]/ivthickness.P[39]
ivthickness.C[45]	 =ivthickness.C[32]
ivthickness.C[46]	 =iterativeiv.C[46]
ivthickness.C[47]	 =8.31443*303/(ivthickness.C[46]*96485.3)*asinh(ivthickness.C[14]/(2*ivthickness.C[45]))
ivthickness.C[48]	 =ivthickness.C[47]/ivthickness.C[14]
ivthickness.P[45]	 =ivthickness.C[45]
ivthickness.P[46]	 =ivthickness.C[46]
ivthickness.P[47]	 =8.31443*303/(ivthickness.P[46]*96485.3)*asinh(ivthickness.P[16]/(2*ivthickness.P[45]))
ivthickness.P[48]	 =ivthickness.P[47]/ivthickness.P[16]
ivthickness.C[51]	 =chem.E[7]*chem.E[20]
ivthickness.C[52]	 =iterativeiv.C[52]
ivthickness.C[53]	 =chem.E[18]/100
ivthickness.C[54]	 =(chem.E[10]+chem.E[11])/100
ivthickness.C[55]	 =iterativeiv.C[132]/10000
ivthickness.C[56]	 =iterativeiv.C[56]
ivthickness.C[57]	 =ivthickness.C[56]*ivthickness.C[55]
ivthickness.C[58]	 =chem.E[51]*ivthickness.C[53]^1.5
ivthickness.C[59]	 =100*ivthickness.C[54]^1.5
if abs(ivthickness.C[14])>ivthickness.C[56]*ivthickness.C[62]*ivthickness.C[55]
    println("Design iter: Using Tafel w. Newman and Tobais expression")
else()
    println("Design iter: Using Linear Kinetics w. Euler and Nonnenmacher expression")
end
# ivthickness.C[60]	 =IF[abs(ivthickness.C[14])>ivthickness.C[56]*ivthickness.C[62]*ivthickness.C[55],"Use Tafel", "Use Linear"]
ivthickness.P[51]	 =ivthickness.C[51]
ivthickness.P[52]	 =ivthickness.C[52]
ivthickness.P[53]	 =ivthickness.C[53]
ivthickness.P[54]	 =ivthickness.C[54]
ivthickness.P[55]	 =ivthickness.C[55]
ivthickness.P[56]	 =ivthickness.C[56]
ivthickness.P[57]	 =ivthickness.C[57]
ivthickness.P[58]	 =ivthickness.C[58]
ivthickness.P[59]	 =ivthickness.C[59]
if abs(ivthickness.P[16])>ivthickness.P[56]*ivthickness.P[62]*ivthickness.P[55]
        println("Design iter: Using Tafel w. Newman and Tobais expression")
else()
    println("Design iter: Using Linear Kinetics w. Euler and Nonnenmacher expression")
end
# ivthickness.P[60]	 =IF[abs(ivthickness.P[16])>ivthickness.P[56]*ivthickness.P[62]*ivthickness.P[55],"Use Tafel", "Use Linear"]
ivthickness.C[62]	 =iterativeiv.C[62]
ivthickness.M[67]	 =pi/2
ivthickness.C[64]	 =(1-ivthickness.C[63])*96485.3/303/8.31443
ivthickness.C[65]	 =ivthickness.C[55]*abs(ivthickness.C[14])*ivthickness.C[64]*(1/ivthickness.C[58]+1/ivthickness.C[59])
ivthickness.C[66]	 =ivthickness.C[55]*abs(ivthickness.C[14])*ivthickness.C[64]/ivthickness.C[58]
if ivthickness.C[65]>19.2
    if ivthickness.C[20]==1
        ivthickness.C[67]	 = atan((ivthickness.C[69]-ivthickness.C[68])*0.1+ivthickness.C[68])+pi
    else() 
        ivthickness.C[67]	 = 1.58
    end
end
if ivthickness.C[65]<=19.2
    if ivthickness.C[20]==1
        ivthickness.C[67]	 = atan((ivthickness.C[69]-ivthickness.C[68])*0.1+ivthickness.C[68])
    else()
        ivthickness.C[67]	 = 1.565
    end
end
# ivthickness.C[67]	 =IF[ivthickness.C[65]>19.2,IF[ivthickness.C[20]=1,atan((ivthickness.C[69]-ivthickness.C[68])*0.1+ivthickness.C[68])+pi,1.58],IF[ivthickness.C[20]=1,atan((ivthickness.C[69]-ivthickness.C[68])*0.1+ivthickness.C[68]),1.565]]
ivthickness.C[68]	 =tan(ivthickness.C[67])
ivthickness.C[69]	 =2*ivthickness.C[65]*ivthickness.C[67]/(4*ivthickness.C[67]^2-ivthickness.C[66]*(ivthickness.C[65]-ivthickness.C[66]))
ivthickness.C[70]	 =atan(ivthickness.C[66]/(2*ivthickness.C[67]))
ivthickness.C[71]	 =((ivthickness.C[65]-ivthickness.C[66])*(ivthickness.C[66]/ivthickness.C[65]+2/ivthickness.C[65]*log(1/cos(ivthickness.C[67]-ivthickness.C[70])))+2*ivthickness.C[66]/ivthickness.C[65]*log(1/cos(ivthickness.C[70]))+log(2*abs(ivthickness.C[14])*ivthickness.C[67]^2/(ivthickness.C[56]*ivthickness.C[62]*ivthickness.C[55]*ivthickness.C[65])))/ivthickness.C[64]
ivthickness.P[62]	 =ivthickness.C[62]
ivthickness.P[63]	 =ivthickness.C[63]
ivthickness.P[64]	 =ivthickness.C[64]
ivthickness.P[65]	 =ivthickness.P[55]*abs(ivthickness.P[16])*ivthickness.P[64]*(1/ivthickness.P[58]+1/ivthickness.P[59])
ivthickness.P[66]	 =ivthickness.P[55]*abs(ivthickness.P[16])*ivthickness.P[64]/ivthickness.P[58]
#
if ivthickness.P[65]>19.2
    if ivthickness.P[20]==1
        ivthickness.P[67]	 = atan((ivthickness.P[69]-ivthickness.P[68])*0.1+ivthickness.P[68])+pi
    else() 
        ivthickness.P[67]	 = 1.8
    end
end
if ivthickness.P[65]<=19.2
    if ivthickness.P[20]==1
        ivthickness.P[67]	 = atan((ivthickness.P[69]-ivthickness.P[68])*0.1+ivthickness.P[68])
    else()
        ivthickness.P[67]	 = 1.565
    end
end
# ivthickness.P[67]	 =IF[ivthickness.P[65]>19.2,IF[ivthickness.P[20]=1,atan((ivthickness.P[69]-ivthickness.P[68])*0.1+ivthickness.P[68])+pi,1.8],IF[ivthickness.P[20]=1,atan((ivthickness.P[69]-ivthickness.P[68])*0.1+ivthickness.P[68]),1.565]]
ivthickness.P[68]	 =tan(ivthickness.P[67])
ivthickness.P[69]	 =2*ivthickness.P[65]*ivthickness.P[67]/(4*ivthickness.P[67]^2-ivthickness.P[66]*(ivthickness.P[65]-ivthickness.P[66]))
ivthickness.P[70]	 =atan(ivthickness.P[66]/(2*ivthickness.P[67]))
ivthickness.P[71]	 =((ivthickness.P[65]-ivthickness.P[66])*(ivthickness.P[66]/ivthickness.P[65]+2/ivthickness.P[65]*log(1/cos(ivthickness.P[67]-ivthickness.P[70])))+2*ivthickness.P[66]/ivthickness.P[65]*log(1/cos(ivthickness.P[70]))+log(2*abs(ivthickness.P[16])*ivthickness.P[67]^2/(ivthickness.P[56]*ivthickness.P[62]*ivthickness.P[55]*ivthickness.P[65])))/ivthickness.P[64]
ivthickness.C[73]	 =sqrt((2*ivthickness.C[63])*96495.3/8.31443/303*ivthickness.C[56]*ivthickness.C[62]*ivthickness.C[55]^2*(1/ivthickness.C[58]+1/ivthickness.C[59]))
ivthickness.C[74]	 =ivthickness.C[14]*ivthickness.C[55]/(ivthickness.C[58]+ivthickness.C[59])*(1+(2+(ivthickness.C[59]/ivthickness.C[58]+ivthickness.C[58]/ivthickness.C[59])*cos(ivthickness.C[73]))/(ivthickness.C[73]*sinh(ivthickness.C[73])))
#
if abs(ivthickness.C[14])>ivthickness.C[56]*ivthickness.C[62]*ivthickness.C[55]
    ivthickness.C[75]	 =    ivthickness.C[71]/ivthickness.C[14]
else()
    ivthickness.C[75]	 =    ivthickness.C[74]/ivthickness.C[14]
end
# ivthickness.C[75]	 =IF[ivthickness.C[60]="Use Tafel",ivthickness.C[71]/ivthickness.C[14],ivthickness.C[74]/ivthickness.C[14]]
ivthickness.P[73]	 =sqrt((2*ivthickness.P[63])*96495.3/8.31443/303*ivthickness.P[56]*ivthickness.P[62]*ivthickness.P[55]^2*(1/ivthickness.P[58]+1/ivthickness.P[59]))
ivthickness.P[74]	 =ivthickness.P[16]*ivthickness.P[55]/(ivthickness.P[58]+ivthickness.P[59])*(1+(2+(ivthickness.P[59]/ivthickness.P[58]+ivthickness.P[58]/ivthickness.P[59])*cos(ivthickness.P[73]))/(ivthickness.P[73]*sinh(ivthickness.P[73])))
#
if abs(ivthickness.P[16])>ivthickness.P[56]*ivthickness.P[62]*ivthickness.P[55]
    ivthickness.P[75]	 =ivthickness.P[71]/ivthickness.P[16]
else()
    ivthickness.P[75]	 =ivthickness.P[74]/ivthickness.P[16]
end
# ivthickness.P[75]	 =IF[ivthickness.P[60]="Use Tafel",ivthickness.P[71]/ivthickness.P[16],ivthickness.P[74]/ivthickness.P[16]]
ivthickness.C[79]	 =ivthickness.C[80]*ivthickness.C[14]
ivthickness.C[80]	 =iterativeiv.C[80]
ivthickness.P[79]	 =ivthickness.P[80]*ivthickness.P[16]
ivthickness.P[80]	 =ivthickness.C[80]
ivthickness.C[83]	 =ivthickness.C[80]+ivthickness.C[75]+ivthickness.C[48]+ivthickness.C[41]+ivthickness.C[35]+ivthickness.C[26]
ivthickness.C[84]	 =ivthickness.C[83]*ivthickness.C[14]
ivthickness.P[83]	 =ivthickness.P[80]+ivthickness.P[75]+ivthickness.P[48]+ivthickness.P[41]+ivthickness.P[35]
ivthickness.P[84]	 =ivthickness.P[83]*ivthickness.P[16]
ivthickness.C[88]	 =ivthickness.C[87]
ivthickness.C[89]	 =ivthickness.C[34]+ivthickness.C[88]
ivthickness.C[90]	 =ivthickness.C[89]+ivthickness.C[40]
ivthickness.C[91]	 =ivthickness.C[47]+ivthickness.C[90]
# 
if abs(ivthickness.C[14])>ivthickness.C[56]*ivthickness.C[62]*ivthickness.C[55]
    ivthickness.C[92]	 =ivthickness.C[71]+ivthickness.C[91]
else()
    ivthickness.C[92]	 =ivthickness.C[74]+ivthickness.C[91]
end
# ivthickness.C[92]	 =IF[ivthickness.C[60]="Use Tafel",ivthickness.C[71]+ivthickness.C[91],ivthickness.C[74]+ivthickness.C[91]]
ivthickness.C[93]	 =ivthickness.C[92]
ivthickness.C[94]	 =ivthickness.C[93]+ivthickness.C[79]