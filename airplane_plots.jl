using Plots
pax=30:75
range=100:10:1000
contour(range,pax,searr',linestyle=:dash,contour_labels=true)