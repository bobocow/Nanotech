%Let's also make a script to draw 3D plots and contours

[Alpha, Beta] = meshgrid(0:0.1:2, 3:0.1:5);

f = (Alpha-1).^2 + (Beta-4).^4;

figure
surf(Alpha,Beta,f)

figure
[c,h] = contour(Alpha,Beta,f,10);

clabel(c,h);