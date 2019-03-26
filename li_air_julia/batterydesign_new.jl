function batterydesign_new(batterydesign,chem,iterativeiv,flowandsys)
# Address	Formula
## Battery Design
#assumed to be open but can be changed to enclosed as well - edit() 
batterydesign.D[6]	 =((batterydesign.C[6]*batterydesign.E[6])/((batterydesign.C[6]*batterydesign.E[6])+(batterydesign.C[7]*batterydesign.E[7])+(batterydesign.C[8]*batterydesign.E[8])))*100
# batterydesign.D[6]	 =IF[chem.E[8]="Enclosed",chem.E[14],batterydesign.C[6]*batterydesign.E[6]/(batterydesign.C[6]*batterydesign.E[6]+batterydesign.C[7]*batterydesign.E[7]+batterydesign.C[8]*batterydesign.E[8])*100]
batterydesign.E[6]	 =chem.E[20]
batterydesign.F[6]	 =batterydesign.F[77]/batterydesign.F[38]*1000
#assumed to be open but can be changed to enclosed as well - edit() 
batterydesign.D[7]	 =batterydesign.C[7]*batterydesign.E[7]/(batterydesign.C[6]*batterydesign.E[6]+batterydesign.C[7]*batterydesign.E[7]+batterydesign.C[8]*batterydesign.E[8])*100
# batterydesign.D[7]	 =IF[chem.E[8]="Enclosed",chem.E[15],batterydesign.C[7]*batterydesign.E[7]/(batterydesign.C[6]*batterydesign.E[6]+batterydesign.C[7]*batterydesign.E[7]+batterydesign.C[8]*batterydesign.E[8])*100]
batterydesign.E[7]	 =chem.E[21]
batterydesign.F[7]	 =batterydesign.F[11]*batterydesign.D[7]/100
#assumed to be open but can be changed to enclosed as well - edit() 
batterydesign.D[8]	 =batterydesign.C[8]*batterydesign.E[8]/(batterydesign.C[6]*batterydesign.E[6]+batterydesign.C[7]*batterydesign.E[7]+batterydesign.C[8]*batterydesign.E[8])*100
# batterydesign.D[8]	 =IF[chem.E[8]="Enclosed",chem.E[16],batterydesign.C[8]*batterydesign.E[8]/(batterydesign.C[6]*batterydesign.E[6]+batterydesign.C[7]*batterydesign.E[7]+batterydesign.C[8]*batterydesign.E[8])*100]
batterydesign.E[8]	 =chem.E[22]
batterydesign.F[8]	 =batterydesign.F[11]*batterydesign.D[8]/100
#assumed to be open but can be changed to enclosed as well - edit() 
batterydesign.C[6]	 = chem.E[9]
batterydesign.C[7]	 = chem.E[10]
batterydesign.C[8]	 = chem.E[11]
# batterydesign.C[6]	 =IF[chem.E[8]="Enclosed",batterydesign.D[6]/batterydesign.E[6]*batterydesign.E[11],chem.E[9]]
# batterydesign.C[7]	 =IF[chem.E[8]="Enclosed",batterydesign.D[7]/batterydesign.E[7]*batterydesign.E[11],chem.E[10]]
# batterydesign.C[8]	 =IF[chem.E[8]="Enclosed",batterydesign.D[8]/batterydesign.E[8]*batterydesign.E[11],chem.E[11]]
batterydesign.C[9]	 =chem.E[12]
batterydesign.C[10]	 =chem.E[18]
batterydesign.E[10]	 =chem.E[46]
batterydesign.C[11]	 =sum(batterydesign.C[6:10])
batterydesign.D[11]	 =sum(batterydesign.D[6:10])
batterydesign.E[11]	 =(100-batterydesign.C[10]-batterydesign.C[9])/(batterydesign.D[6]/batterydesign.E[6]+batterydesign.D[7]/batterydesign.E[7]+batterydesign.D[8]/batterydesign.E[8])
batterydesign.F[10]	 =batterydesign.F[11]*batterydesign.D[10]/100
batterydesign.F[11]	 =batterydesign.F[6]/batterydesign.D[6]*100
batterydesign.F[12]	 =batterydesign.F[11]-batterydesign.F[15]*1/batterydesign.F[42]
batterydesign.F[13]	 =batterydesign.F[11]-batterydesign.F[6]
batterydesign.D[15]	 =chem.E[27]
batterydesign.E[15]	 =chem.E[33]
batterydesign.D[16]	 =chem.E[28]
batterydesign.E[16]	 =chem.E[34]
batterydesign.D[17]	 =chem.E[29]
batterydesign.E[17]	 =chem.E[35]
batterydesign.C[18]	 =chem.E[31]
batterydesign.F[15]	 =batterydesign.F[77]/batterydesign.F[40]*1000*batterydesign.F[42]*(1+batterydesign.F[47]/100)
batterydesign.F[16]	 =batterydesign.F[19]*batterydesign.D[16]/100
batterydesign.F[17]	 =batterydesign.F[19]*batterydesign.D[17]/100
batterydesign.F[18]	 =batterydesign.F[19]*batterydesign.D[18]/100
batterydesign.D[19]	 =sum([batterydesign.D[15],batterydesign.D[16],batterydesign.D[17],batterydesign.D[18]])
batterydesign.E[19]	 =(100-batterydesign.C[18])/(batterydesign.D[15]/batterydesign.E[15]+batterydesign.D[17]/batterydesign.E[17]+batterydesign.D[16]/batterydesign.E[16])
batterydesign.F[19]	 =batterydesign.F[15]/batterydesign.D[15]*100
# the following two are not really needed
# batterydesign.C[21]	 =IF[chem.E[37]="aluminum","Al","Cu"]
# batterydesign.C[22]	 =IF[chem.E[40]="aluminum","Al","Cu"]
batterydesign.D[21]	 =chem.E[38]
batterydesign.D[22]	 =chem.E[41]
batterydesign.D[23]	 =chem.E[43]
# Positive is Al and negative has Cu -- removing things not needed
batterydesign.E[21]	 =2.7
batterydesign.E[22]	 =8.92
# batterydesign.E[21]	 =IF[batterydesign.C[21]="Al",2.7,8.92]
# batterydesign.E[22]	 =IF[batterydesign.C[22]="Al",2.7,8.92]
batterydesign.E[23]	 =chem.E[45]
batterydesign.E[24]	 =chem.E[46]
batterydesign.F[21]	 =batterydesign.F[104]*((batterydesign.F[105]+2*flowandsys.C[68])*(batterydesign.F[106]+2*flowandsys.C[68])*flowandsys.C[64]+batterydesign.F[107]*batterydesign.F[108])/1000000
batterydesign.F[22]	 =(batterydesign.F[104]+1)*((batterydesign.F[105]+2*flowandsys.C[68])*(batterydesign.F[106]+2*flowandsys.C[68])+batterydesign.F[107]*batterydesign.F[108])/1000000
batterydesign.F[23]	 =2*batterydesign.F[104]*batterydesign.F[105]*batterydesign.F[106]/1000000
batterydesign.F[24]	 =(batterydesign.F[11]/batterydesign.E[11]*batterydesign.C[10]/100+batterydesign.F[19]/batterydesign.E[19]*batterydesign.C[18]/100+batterydesign.F[23]*batterydesign.D[23]*chem.E[44]/100+batterydesign.F[33]*batterydesign.F[105]*batterydesign.F[106]/1000*0.02)/1000
batterydesign.F[25]	 =batterydesign.E[21]*(batterydesign.F[109]*batterydesign.F[35]*batterydesign.F[108])/1000
batterydesign.F[26]	 =batterydesign.E[22]*(batterydesign.F[109]*batterydesign.F[35]*batterydesign.F[108])/1000
batterydesign.F[28]	 =30+batterydesign.F[27]+20
batterydesign.F[29]	 =(30*1.4+batterydesign.F[27]*2.7+20*0.9)/batterydesign.F[28]
batterydesign.F[30]	 =(batterydesign.F[110]+2*batterydesign.F[33]+6)*(batterydesign.F[111]-6)*batterydesign.F[28]*2/1000*batterydesign.F[29]/1000
batterydesign.F[31]	 =batterydesign.F[12]+batterydesign.F[19]+batterydesign.F[21]*batterydesign.D[21]*batterydesign.E[21]+batterydesign.F[22]*batterydesign.D[22]*batterydesign.E[22]+batterydesign.F[23]*batterydesign.D[23]*batterydesign.E[23]+ batterydesign.F[24]*batterydesign.E[24]*1000+batterydesign.F[25]+batterydesign.F[26]+batterydesign.F[30]
batterydesign.F[32]	 =flowandsys.C[43]
batterydesign.F[33]	 =batterydesign.F[112]
batterydesign.F[38]	 =chem.E[7]
batterydesign.F[39]	 =batterydesign.F[38]/1000*batterydesign.D[6]/100*batterydesign.E[11]
batterydesign.F[40]	 =chem.E[25]
batterydesign.F[41]	 =batterydesign.F[40]/1000*batterydesign.D[15]/100*batterydesign.E[19]
batterydesign.F[42]	 =chem.E[24]
batterydesign.F[44]	 =chem.E[48]
batterydesign.F[45]	 =chem.E[49]
batterydesign.F[46]	 =chem.E[62]
batterydesign.F[48]	 =chem.E[63]
batterydesign.F[52]	 =iterativeiv.C[143]*100
# Duration of power burst -- changed for to 120s
 batterydesign.F[56]	 =120; #one of the control variables
# batterydesign.F[56]	 =IF[batterydesign.F[54]="microHEV",2,10]
batterydesign.F[57]	 =iterativeiv.C[4]
batterydesign.F[58]	 =iterativeiv.C[6]/batterydesign.F[62]
batterydesign.F[62]	 =batterydesign.F[60]*batterydesign.F[61]
batterydesign.F[66]	 =batterydesign.F[62]*batterydesign.F[58]
batterydesign.F[67]	 =batterydesign.F[66]*batterydesign.F[64]
if batterydesign.F[132]*batterydesign.F[62]<20
batterydesign.F[70]	 =batterydesign.F[69]+2*1
end
if batterydesign.F[132]*batterydesign.F[62]<40
batterydesign.F[70]	 =batterydesign.F[69]+2*1.5
end
if batterydesign.F[132]*batterydesign.F[62]>=40
batterydesign.F[70]	 =batterydesign.F[69]+2*2;    
end
# batterydesign.F[70]	 =batterydesign.F[69]+2*IF[batterydesign.F[132]*batterydesign.F[62]<20,1,IF[batterydesign.F[132]*batterydesign.F[62]<40,1.5,2]]
batterydesign.F[72]	 =batterydesign.F[139]
batterydesign.F[76]	 =iterativeiv.C[18]*batterydesign.F[59]
batterydesign.F[77]	 =batterydesign.F[76]/batterydesign.F[59]
if batterydesign.F[56]==10
    batterydesign.F[79]	 =85
else()
    batterydesign.F[79]	 =150
end
# batterydesign.F[79]	 =IF[batterydesign.F[56]=10,85,150]
if batterydesign.F[56]==10
batterydesign.F[80]	 =chem.E[52]*1
else()
    batterydesign.F[80]	 =chem.E[52]*2
end
# batterydesign.F[80]	 =chem.E[52]*IF[batterydesign.F[56]=10,1,2]
batterydesign.F[81]	 =iterativeiv.C[141]-batterydesign.F[87]
#assuming that it is copper
batterydesign.F[82]	 =1/(3.8*100000*batterydesign.D[21]*0.0001/2)+1*sqrt(batterydesign.F[21]/batterydesign.F[22])/(6*100000*batterydesign.D[22]*0.0001/2)
# batterydesign.F[82]	 =IF[batterydesign.C[22]="Cu",1/(3.8*100000*batterydesign.D[21]*0.0001/2)+1*sqrt(batterydesign.F[21]/batterydesign.F[22])/(6*100000*batterydesign.D[22]*0.0001/2),2/(3.8*100000*batterydesign.D[21]*0.0001/2)]
batterydesign.F[83]	 =batterydesign.F[82]*(batterydesign.F[106]^2/3+batterydesign.F[106]*batterydesign.F[107])/100
# assuming that is it copper
batterydesign.F[84]	 =(10/3.8+10/6)/batterydesign.F[35]*batterydesign.F[109]/batterydesign.F[108]/100000*batterydesign.F[102]+batterydesign.F[49]/100*batterydesign.F[44]/batterydesign.F[141]*batterydesign.F[102]
# batterydesign.F[84]	 =(10/3.8+10/IF[batterydesign.C[22]="Cu",6,3.8])/batterydesign.F[35]*batterydesign.F[109]/batterydesign.F[108]/100000*batterydesign.F[102]+batterydesign.F[49]/100*batterydesign.F[44]/batterydesign.F[141]*batterydesign.F[102]
batterydesign.F[85]	 =batterydesign.F[121]+batterydesign.F[157]+batterydesign.F[158]/(batterydesign.F[62]*batterydesign.F[63]^2)
batterydesign.F[86]	 =batterydesign.F[85]/(batterydesign.F[58]*batterydesign.F[59]^2)
batterydesign.F[87]	 =batterydesign.F[83]+batterydesign.F[84]+batterydesign.F[86]*batterydesign.F[102]
batterydesign.F[88]	 =batterydesign.F[81]+batterydesign.F[87]
batterydesign.F[89]	 =batterydesign.F[87]+iterativeiv.C[142]
batterydesign.F[91]	 =batterydesign.F[39]*batterydesign.F[42]/batterydesign.F[41]
batterydesign.F[92]	 =batterydesign.F[48]
batterydesign.F[93]	 =batterydesign.F[48]*batterydesign.F[91]
batterydesign.F[94]	 =max(batterydesign.F[92],batterydesign.F[93])
batterydesign.F[95]	 =batterydesign.F[77]/batterydesign.F[39]/batterydesign.F[100]*10000
batterydesign.F[96]	 =batterydesign.F[42]*batterydesign.F[77]/batterydesign.F[41]/batterydesign.F[100]*10000
batterydesign.F[97]	 =iterativeiv.C[132]
batterydesign.F[98]	 =iterativeiv.C[133]
batterydesign.F[100] =iterativeiv.C[134]
batterydesign.F[101]	 =batterydesign.F[100]*batterydesign.F[95]/batterydesign.F[48]
batterydesign.F[102]	 =max(batterydesign.F[100],batterydesign.F[101])
batterydesign.F[104]	 =iterativeiv.C[136]/2
batterydesign.F[105]	 =flowandsys.C[62]*10
batterydesign.F[106]	 =flowandsys.C[63]*10
batterydesign.F[107]	 =flowandsys.C[69]+flowandsys.C[68]
batterydesign.F[108]	 =batterydesign.F[105]/4
batterydesign.F[109]	 =flowandsys.C[70]
batterydesign.F[110]	 =batterydesign.F[105]+2*batterydesign.F[34]+2*flowandsys.C[68]+2*flowandsys.C[71]
batterydesign.F[111]	 =batterydesign.F[106]+batterydesign.F[107]+batterydesign.F[109]-5
batterydesign.F[112]	 =(batterydesign.F[104]+1)*flowandsys.C[35]/1000+batterydesign.F[104]*(flowandsys.C[36]/1000+flowandsys.C[44]*2/1000)+2*batterydesign.F[104]*(iterativeiv.C[133]/1000+iterativeiv.C[38]*10+iterativeiv.C[132]/1000)+2*flowandsys.C[71]
batterydesign.F[113]	 =batterydesign.F[110]*batterydesign.F[111]*batterydesign.F[112]/1000
batterydesign.F[115]	 =batterydesign.F[76]
if batterydesign.F[59]==1
    batterydesign.F[116]	 =0
else()
    batterydesign.F[116]	 =batterydesign.F[59]*batterydesign.F[33]*batterydesign.F[35]/2*batterydesign.F[108]*1.5/1000*8.92
end
# batterydesign.F[116]	 =IF[batterydesign.F[59]=1,0,batterydesign.F[59]*batterydesign.F[33]*batterydesign.F[35]/2*batterydesign.F[108]*1.5/1000*8.92]
batterydesign.F[117]	 =8*batterydesign.F[58]/batterydesign.F[59]
batterydesign.F[118]	 =batterydesign.F[50]*0.092*4.19
batterydesign.F[119]	 =(batterydesign.F[118]*8.92/600000)^0.5
if batterydesign.F[62]==1
batterydesign.F[120]	 =0
else()
    batterydesign.F[120]	 =2*(2/batterydesign.F[118]*batterydesign.F[141]*batterydesign.F[119])*1.2
end
# batterydesign.F[120]	 =IF[batterydesign.F[62]=1,0,2]*(2/batterydesign.F[118]*batterydesign.F[141]*batterydesign.F[119])*1.2
if batterydesign.F[62]==1
   batterydesign.F[121]	 =0
else()
    batterydesign.F[121]	 =2*(2/batterydesign.F[141]*batterydesign.F[119])
end
# batterydesign.F[121]	 =IF[batterydesign.F[62]=1,0,2]*(2/batterydesign.F[141]*batterydesign.F[119])
batterydesign.F[122]	 =batterydesign.F[85]*batterydesign.F[58]/batterydesign.F[59]^2+batterydesign.F[121]
# useless thing
# batterydesign.F[123]	 =IF[batterydesign.F[55]="EG-W","aluminum","polymer"]
batterydesign.F[125]	 =batterydesign.F[106]
batterydesign.F[127]	 =(batterydesign.F[58]/2)*batterydesign.F[125]*(batterydesign.F[110]+2*batterydesign.F[126])*batterydesign.F[126]/1000*2.7*0.5
# assuming EG-W instead of CA
batterydesign.F[128]	 =2.7*batterydesign.F[124]*(batterydesign.F[129]*batterydesign.F[130]+batterydesign.F[129]*batterydesign.F[131]+batterydesign.F[130]*batterydesign.F[131])*2/1000
# batterydesign.F[128]	 =IF[batterydesign.F[55]="EG-W",2.7,1.1]*batterydesign.F[124]*(batterydesign.F[129]*batterydesign.F[130]+batterydesign.F[129]*batterydesign.F[131]+IF[batterydesign.F[55]="CA",0,batterydesign.F[130]*batterydesign.F[131]])*2/1000
batterydesign.F[129]	 =batterydesign.F[111]+2
batterydesign.F[130]	 =(batterydesign.F[33]+batterydesign.F[126]/2)*(batterydesign.F[58]+1)+1
batterydesign.F[131]	 =batterydesign.F[110]+2*batterydesign.F[124]+flowandsys.C[73]
batterydesign.F[132]	 =batterydesign.F[129]*batterydesign.F[130]*batterydesign.F[131]/1000000
batterydesign.F[133]	 =((batterydesign.F[116]*batterydesign.F[58]/batterydesign.F[59]+1)+batterydesign.F[58]*batterydesign.F[31]+batterydesign.F[117]+batterydesign.F[120]+batterydesign.F[127]+batterydesign.F[128])/1000
batterydesign.F[135]	 =batterydesign.F[115]*batterydesign.F[63]
batterydesign.F[136]	 =batterydesign.F[76]*batterydesign.F[63]*(batterydesign.F[139]-batterydesign.F[66]/batterydesign.F[59]*batterydesign.F[77]/5*batterydesign.F[89]/batterydesign.F[102]/batterydesign.F[63])/1000
batterydesign.F[137]	 =flowandsys.C[11]
batterydesign.F[138]	 =batterydesign.F[66]/batterydesign.F[59]*batterydesign.F[44]/batterydesign.F[63]
batterydesign.F[139]	 =batterydesign.F[66]/batterydesign.F[59]*batterydesign.F[45]/batterydesign.F[63]
batterydesign.F[140]	 =(batterydesign.F[138]^2*batterydesign.F[63]^2*batterydesign.F[59]^2/batterydesign.F[66]*batterydesign.F[51]/100*(100-batterydesign.F[51])/100)/(batterydesign.F[88]/batterydesign.F[102])/1000
if max(batterydesign.F[95],batterydesign.F[96])<batterydesign.F[48]
    batterydesign.F[141]	 =    batterydesign.F[57]*1000/batterydesign.F[138]/batterydesign.F[51]*100
else()
    batterydesign.F[141]	 =    batterydesign.F[57]*1000/batterydesign.F[138]/batterydesign.F[52]*100
end
# batterydesign.F[141]	 =IF[max(batterydesign.F[95],batterydesign.F[96])<batterydesign.F[48],batterydesign.F[57]*1000/batterydesign.F[138]/batterydesign.F[51]*100,batterydesign.F[57]*1000/batterydesign.F[138]/batterydesign.F[52]*100]
batterydesign.F[142]	 =batterydesign.F[141]*1000/batterydesign.F[102]/batterydesign.F[59]/batterydesign.F[63]
batterydesign.F[143]	 =batterydesign.F[141]/batterydesign.F[76]/batterydesign.F[63]
batterydesign.F[146]	 =batterydesign.F[60]*batterydesign.F[130]+2*batterydesign.F[70]+2*batterydesign.F[145]

if batterydesign.F[61]==1
batterydesign.F[147]	 =batterydesign.F[61]*batterydesign.F[129]+8+2*batterydesign.F[70]
end
if batterydesign.F[61]==2
batterydesign.F[147]	 =batterydesign.F[61]*batterydesign.F[129]+10+2*batterydesign.F[70]
end
if batterydesign.F[61]==4
batterydesign.F[147]	 =batterydesign.F[61]*batterydesign.F[129]+20+2*batterydesign.F[70]
end
# batterydesign.F[147]	 =batterydesign.F[61]*batterydesign.F[129]+IF[batterydesign.F[61]=1,8,IF[batterydesign.F[61]=2,10,IF[batterydesign.F[61]=4,20]]]+2*batterydesign.F[70]
batterydesign.F[148]	 =batterydesign.F[131]+2*batterydesign.F[70]
batterydesign.F[151]	 =batterydesign.F[146]*batterydesign.F[149]*batterydesign.F[150]*2/1000000
# assuming interation unit will require 30L of integration
batterydesign.F[152]	 =30
# batterydesign.F[152]	 =IF[OR[batterydesign.F[54]="PHEV",batterydesign.F[54]="EV"],4,IF[OR[batterydesign.F[54]="HEV-HP",batterydesign.F[54]="microHEV"],2]]*IF[batterydesign.F[64]=2,1.5,IF[batterydesign.F[64]=3,2,1]]
batterydesign.F[153]	 =batterydesign.F[146]*batterydesign.F[147]*batterydesign.F[148]/1000000+batterydesign.F[151]+batterydesign.F[152]
batterydesign.F[154]	 =(5/batterydesign.F[118]*batterydesign.F[141]*batterydesign.F[119])*1.2
batterydesign.F[155]	 =2*batterydesign.F[145]*(batterydesign.F[147]-2*batterydesign.F[70])*(batterydesign.F[148]-2*batterydesign.F[70])/1000*7.8
batterydesign.F[156]	 =((batterydesign.F[146]-2*batterydesign.F[70])/10)^2*batterydesign.F[141]/600000/batterydesign.F[68]*8.92
# batterydesign.F[156]	 =IF[AND[batterydesign.F[61]=1,batterydesign.F[60]>0],((batterydesign.F[146]-2*batterydesign.F[70])/10)^2*batterydesign.F[141]/600000/batterydesign.F[68]*8.92,0]
batterydesign.F[157]	 =(batterydesign.F[62]-1)*2*(3/batterydesign.F[141]*batterydesign.F[119])
batterydesign.F[158]	 =2*(3/batterydesign.F[141]*batterydesign.F[119])
batterydesign.F[160]	 =batterydesign.F[159]*0.1
batterydesign.F[161]	 =(flowandsys.C[73]*batterydesign.F[129]*2/3*batterydesign.F[130]+(batterydesign.F[58]/2)*batterydesign.F[125]*(batterydesign.F[110]+2*batterydesign.F[126])*batterydesign.F[126]*0.5)*batterydesign.F[62]*1.07*10^-6
batterydesign.F[162]	 =batterydesign.F[69]/10*0.032+(batterydesign.F[70]-batterydesign.F[69])/10*2.7
batterydesign.F[164]	 =(2*(batterydesign.F[146]-batterydesign.F[70])*(batterydesign.F[147]-batterydesign.F[70])+2*(batterydesign.F[146]-batterydesign.F[70])*(batterydesign.F[148]-batterydesign.F[70])+2*(batterydesign.F[147]-batterydesign.F[70])*(batterydesign.F[148]-batterydesign.F[70]))/100*batterydesign.F[162]/1000+(batterydesign.F[62]+1)*batterydesign.F[154]/1000+batterydesign.F[155]/1000+batterydesign.F[156]/1000+batterydesign.F[163]
batterydesign.F[165]	 =batterydesign.F[152]
batterydesign.F[166]	 =batterydesign.F[62]*batterydesign.F[133]+batterydesign.F[161]+batterydesign.F[164]+batterydesign.F[165]
batterydesign.F[167]	 =batterydesign.F[153]*batterydesign.F[64]
batterydesign.F[168]	 =batterydesign.F[166]*batterydesign.F[64]
batterydesign.F[170]	 =components.B[10]
batterydesign.F[171]	 =components.C[10]
batterydesign.F[172]	 =batterydesign.F[170]+batterydesign.F[167]
batterydesign.F[173]	 =batterydesign.F[171]+batterydesign.F[168]
batterydesign.F[183]	 =(batterydesign.F[182]/batterydesign.F[64])
batterydesign.F[184]	 =chem.E[65]
batterydesign.F[185]	 =batterydesign.F[136]*batterydesign.F[184]/100/batterydesign.F[183]*1000
batterydesign.F[189]	 =flowandsys.C[10]
batterydesign.F[191]	 =batterydesign.F[76]
batterydesign.F[192]	 =batterydesign.F[191]
batterydesign.F[193]	 =batterydesign.F[192]
batterydesign.F[194]	 =batterydesign.F[97]
batterydesign.D[219]	 =1
batterydesign.F[200]	 =batterydesign.F[57]
batterydesign.F[201]	 =batterydesign.F[136]
batterydesign.F[202]	 =batterydesign.F[137]
batterydesign.F[203]	 =batterydesign.F[77]*1000/batterydesign.F[102]
batterydesign.F[204]	 =iterativeiv.C[137]
batterydesign.F[205]	 =batterydesign.F[168]
batterydesign.F[206]	 =batterydesign.F[167]
batterydesign.F[207]	 =batterydesign.F[202]*1000/batterydesign.F[205]
batterydesign.F[208]	 =batterydesign.F[202]*1000/batterydesign.F[206]
batterydesign.F[209]	 =batterydesign.F[210]/batterydesign.F[202]
# Cost esitmates -- not going down that hole
# batterydesign.F[210]	 ="summary of Results'!batterydesign.F[70]+'summary of Results"!batterydesign.F[71]
batterydesign.F[211]	 =batterydesign.F[173]
batterydesign.F[212]	 =batterydesign.F[172]
batterydesign.F[213]	 =batterydesign.F[202]/batterydesign.F[211]*1000
batterydesign.F[214]	 =batterydesign.F[202]*1000/batterydesign.F[212]
# batterydesign.F[215]	 ="summary of Results"!batterydesign.F[73]/batterydesign.F[202]
# batterydesign.F[216]	 =45000*batterydesign.F[219]/1000/batterydesign.F[202]+batterydesign.F[215]
batterydesign.F[217]	 =batterydesign.F[211]-batterydesign.F[67]/1000*(batterydesign.F[12]-batterydesign.F[13])
batterydesign.F[218]	 =batterydesign.F[202]*1000/batterydesign.F[217]
batterydesign.F[219]	 =batterydesign.F[141]*batterydesign.F[67]/batterydesign.F[63]/batterydesign.D[219]/1000
end