SER=zeros(651,1)
pax=50
MTOM=50000
for n=350:1000
    SER[n-349],a,b=SERP(n,pax,MTOM)
end

