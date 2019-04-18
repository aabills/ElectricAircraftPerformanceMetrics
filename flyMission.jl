 function flyMission(airplane,mainMission,reserve)
            #INPUTS: mission, reserve, plane
        
            #Initialize Saved Quantity Arrays
            airplane.powerProfile=Float64[]
            airplane.altitudeProfile=Float64[]
            airplane.velocityProfile=Float64[]
            airplane.distTraveled=Float64[]
            airplane.elapsedTime=Float64[]
    
            #Initialize first quantities
            airplane.velocity=10;
            airplane.n=1
            mainMission.n=0;
            airplane.POF=1;
        
            #Temporary: dt=1 [see model improvement notes]
            dt=1
            
            #Only use takeoff if propeller efficiency is calculated
            if(false)
        
        
            else

                append!(airplane.altitudeProfile,15)
                append!(airplane.elapsedTime,0)
                append!(airplane.velocityProfile,89)
                append!(airplane.distTraveled,0)
                append!(airplane.powerProfile,0)
                airplane.POF=airplane.POF+1
                append!(airplane.segmentTransition,airplane.n)
                airplane=update(airplane,mainMission)
            end
    
    
    
    
    
    # Take Off [POF 1]

            



    # Climb [POF 2]
            while(airplane.altitudeProfile[airplane.n]<mainMission.cruisingAlt)
                mainMission=atmosphericparameters(mainMission,airplane)
                airplane,mainMission=climb(airplane,mainMission,dt)
            end
            airplane.POF=airplane.POF+1
            
            append!(airplane.segmentTransition,airplane.n)



            # Transition[POF 3]   
            #while(false)
            #    [mainMission]=mainMission.atmosphericparameters[airplane]
            #    [airplane,mainMission]=airplane.accelerate[mainMission,dt,"energy"]
            #end
            #Mission

            airplane.POF=airplane.POF+1
            append!(airplane.segmentTransition,airplane.n)
            
            # Cruise[POF 4]

            while(airplane.distTraveled[airplane.n]<=mainMission.range)
                
                mainMission=atmosphericparameters(mainMission,airplane)
                airplane,mainMission=cruise(airplane,mainMission,dt,"main")
		
            end
            airplane.POF=airplane.POF+1
            append!(airplane.segmentTransition,airplane.n)

            # Transition[POF 5]

            #No Actual transition here
            #Mission
            airplane.POF=airplane.POF+1
            append!(airplane.segmentTransition,airplane.n)

            # Descend[POF 6]

            while(airplane.altitudeProfile[airplane.n]>=15)
                mainMission=atmosphericparameters(mainMission,airplane)
                airplane,mainMission=descend(airplane,mainMission,dt,"main")
		
            end
            airplane.POF=airplane.POF+1
            append!(airplane.segmentTransition,airplane.n)
            # Transition [POF 7]

            #while(false)
            #    [mainMission]=mainMission.atmosphericparameters[airplane]
            #    [airplane,mainMission]=airplane.decelerate[mainMission,1]
            #end
            airplane.POF=airplane.POF+1
            append!(airplane.segmentTransition,airplane.n)
  
            #
#            # Reserve Climb [POF 8]
#
           # while(airplane.altitudeProfile[airplane.n]<=reserve.cruisingAlt)
           #    reserve=atmosphericparameters(reserve,airplane)
           #     airplane,reserve=climb(airplane,reserve,dt)
           # end
           # airplane.POF=airplane.POF+1
           # append!(airplane.segmentTransition,airplane.n)

#            # Reserve Cruise [POF 9]

           # while((airplane.distTraveled[airplane.n]-airplane.distTraveled[airplane.segmentTransition[7]])<=(reserve.range))
           #     reserve=atmosphericparameters(reserve,airplane)
           #    airplane,reserve=cruise(airplane,reserve,dt,"reserve")
            #end
            #airplane.POF=airplane.POF+1
           # append!(airplane.segmentTransition,airplane.n)
#            
#            # Reserve Descend[POF 10]

         #   while(airplane.altitudeProfile[airplane.n]>=15)
       #         reserve=atmosphericparameters(reserve,airplane)
   #             airplane,reserve=descend(airplane,reserve,dt,"reserve")
  #          end
 #           airplane.POF=airplane.POF+1
#           append!(airplane.segmentTransition,airplane.n)
#            
#            # Land [POF 11]

###            
        
            #Print Power Profile
           # airplane.printPowerProfileToDatFile["alecpower.dat"]

            return airplane,mainMission,reserve
end