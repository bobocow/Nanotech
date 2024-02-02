%Let's create a script to show us how to draw 2-D plots

x = 0:pi/50:2*pi

y = sin(x)

z = cos(x)

plot(x,y,'-','LineWidth',2.0); hold on; %The "hold on" input means further modifications to plot are expected.

plot(x,z,':','LineWidth',2.0); hold off;

xlabel('x')

ylabel('sin(x) & cos(x)')

legend('sin(x)','cos(x)')