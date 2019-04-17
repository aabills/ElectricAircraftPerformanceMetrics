function raymerPowerVelocity(airplane,mission)
raymerPowerVelocity=sqrt(2*airplane.W/mission.density[mission.n]/airplane.S*sqrt(airplane.K/3/airplane.C_D0));
end

function raymerEnergyVelocity(airplane,mission)
raymerEnergyVelocity=sqrt(2*airplane.W/mission.density[mission.n]/airplane.S*sqrt(airplane.K/airplane.C_D0));
end

function raymerPower(airplane,mission)
raymerPower=((0.5*(airplane.velocity.^3)*airplane.S*airplane.C_D0*mission.density[mission.n])+(2*airplane.K*(airplane.W.^2)/mission.density[mission.n]/airplane.velocity/airplane.S)+(airplane.velocity*sind(airplane.gamma)*airplane.W))/airplane.eta_prop/airplane.eta_mech;
    
    airplane.thrust=raymerPower./airplane.velocity
   
return raymerPower
end