# Address	Formula
## flow and system()
flowandsys.C[9] = 5000;#Totalpower
flowandsys.C[10] = 6500;#Total energy 

flowandsys.C[5]	 =chem.E[6]
flowandsys.C[11]	 =flowandsys.C[10]*flowandsys.C[12]/100-flowandsys.C[106]
flowandsys.C[22]	 =flowandsys.C[101]
flowandsys.C[24]	 =flowandsys.C[105]
flowandsys.C[28]	 =flowandsys.C[9]+flowandsys.C[23]
flowandsys.C[29]	 =flowandsys.C[13]+flowandsys.C[25]
flowandsys.C[30]	 =flowandsys.C[10]*flowandsys.C[12]/100
flowandsys.C[31]	 =flowandsys.C[10]+flowandsys.C[106]
flowandsys.C[35]	 =chem.E[41]
flowandsys.C[36]	 =chem.E[38]
if flowandsys.C[40]==1
    flowandsys.C[44]	 =(flowandsys.C[59]-flowandsys.C[41])*0.1+flowandsys.C[45]
else()
    flowandsys.C[44]	 =50
end
# flowandsys.C[44]	 =IF[flowandsys.C[40]=1,(flowandsys.C[59]-flowandsys.C[41])*0.1+flowandsys.C[45],50]
flowandsys.C[45]	 =flowandsys.C[44]
flowandsys.C[53]	 =iterativeiv.C[138]*iterativeiv.C[135]*flowandsys.C[19]/(flowandsys.C[5]*flowandsys.C[4])
flowandsys.C[54]	 =flowandsys.C[53]*(flowandsys.C[19]-1)/flowandsys.C[19]
flowandsys.C[55]	 =flowandsys.C[53]*(1-flowandsys.C[6])/flowandsys.C[6]
flowandsys.C[56]	 =(flowandsys.C[53]+flowandsys.C[54])/2+flowandsys.C[55]
flowandsys.C[57]	 =flowandsys.C[56]*flowandsys.C[3]*(flowandsys.C[18]+273)/(flowandsys.C[16]*1000)
flowandsys.C[58]	 =2*flowandsys.C[44]/1000000
flowandsys.C[59]	 =64*flowandsys.C[50]*(flowandsys.C[63]+2*flowandsys.C[68]/10)/100*flowandsys.C[57]/(2*flowandsys.C[58]^2*2*flowandsys.C[44]/1000000*flowandsys.C[62]/100*2*flowandsys.C[44]/(4*flowandsys.C[44]+2*flowandsys.C[36]))/1000
flowandsys.C[60]	 =flowandsys.C[50]*(flowandsys.C[63]+2*flowandsys.C[68]/10)/100*flowandsys.C[57]/(flowandsys.C[46]*10^-12*flowandsys.C[44]/1000000*flowandsys.C[62]/100)/1000
flowandsys.C[61]	 =iterativeiv.C[137]*(flowandsys.C[63]+2*flowandsys.C[68]/10)/flowandsys.C[63]
flowandsys.C[62]	 =sqrt(iterativeiv.C[135]/flowandsys.C[43])
flowandsys.C[63]	 =iterativeiv.C[135]/flowandsys.C[62]
#this is set to stamped but can be changed to DM as well
flowandsys.C[64]	 =(4*flowandsys.C[44]+4*flowandsys.C[44]+2*flowandsys.C[36])/(4*flowandsys.C[44]+2*flowandsys.C[36])
# flowandsys.C[64]	 =IF[flowandsys.C[49]="stamped",(4*flowandsys.C[44]+4*flowandsys.C[44]+2*flowandsys.C[36])/(4*flowandsys.C[44]+2*flowandsys.C[36]),1]
flowandsys.C[76]	 =(iterativeiv.C[133]+iterativeiv.C[38]*10^4+iterativeiv.C[132]+flowandsys.C[35]/2+flowandsys.C[36]+flowandsys.C[44])/1000
flowandsys.C[77]	 =(flowandsys.C[98]+flowandsys.C[99])*flowandsys.C[3]*(flowandsys.C[18]+273)/(flowandsys.C[16]*1000)
flowandsys.C[78]	 =flowandsys.C[100]/1000/flowandsys.C[77]
flowandsys.C[79]	 =flowandsys.C[72]/10*flowandsys.C[87]/4
flowandsys.C[80]	 =flowandsys.C[77]/(flowandsys.C[79]/10000)
flowandsys.C[81]	 =0.5*flowandsys.C[78]*flowandsys.C[80]^2/1000
flowandsys.C[84]	 =0.5*flowandsys.C[78]/1000*((flowandsys.C[77])/(flowandsys.C[83]/10*flowandsys.C[63]/10000))^2
#this is also set to stamped
flowandsys.C[85]	 =flowandsys.C[84]/flowandsys.C[59]*100
# flowandsys.C[85]	 =IF[flowandsys.C[49]="stamped",flowandsys.C[84]/flowandsys.C[59]*100,flowandsys.C[84]/flowandsys.C[60]*100]
flowandsys.C[87]	 =flowandsys.C[62]+(2*flowandsys.C[71]+flowandsys.C[73])/10
flowandsys.C[88]	 =flowandsys.C[63]+(2*flowandsys.C[68]+2*flowandsys.C[71]+flowandsys.C[70]+flowandsys.C[72])/10
flowandsys.C[89]	 =iterativeiv.C[136]*iterativeiv.C[6]*flowandsys.C[76]/10
flowandsys.C[96]	 =(flowandsys.C[95]-1)/flowandsys.C[95]
flowandsys.C[98]	 =flowandsys.C[28]*1000/iterativeiv.C[139]*flowandsys.C[19]/(flowandsys.C[5]*flowandsys.C[4])
flowandsys.C[99]	 =flowandsys.C[98]*(1-flowandsys.C[6])/flowandsys.C[6]
flowandsys.C[100]	 =32*flowandsys.C[98]+28*flowandsys.C[99]
flowandsys.C[101]	 =flowandsys.C[100]*flowandsys.C[94]*((flowandsys.C[15]/101.3)^flowandsys.C[96]-1)/flowandsys.C[93]*(flowandsys.C[17]+273)/1000
flowandsys.C[102]	 =flowandsys.C[29]*1000/iterativeiv.C[140]*flowandsys.C[19]/(flowandsys.C[5]*flowandsys.C[4])
flowandsys.C[103]	 =flowandsys.C[102]*(1-flowandsys.C[6])/flowandsys.C[6]
flowandsys.C[104]	 =32*flowandsys.C[102]+28*flowandsys.C[103]
flowandsys.C[105]	 =flowandsys.C[104]*flowandsys.C[94]*((flowandsys.C[15]/101.3)^flowandsys.C[96]-1)/flowandsys.C[93]*(flowandsys.C[17]+273)/1000
flowandsys.C[106]	 =flowandsys.C[105]*5