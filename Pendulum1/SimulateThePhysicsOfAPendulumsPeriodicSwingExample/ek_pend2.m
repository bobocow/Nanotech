clc;
clear all;
%close all;
L1=1;  % Length of Pendulum
L2=1;

g=9.8; % Gravity 
M1=1; % mass 1
M2=2; % mass 2

N=100;  % Maximum number of time steps
dt=0.01;  % Step size for time

w1(1:N)=0;  % Angular velocity 1 array
Theta1(1:N)=0;  % Angular coordinate 1 array

t(1:N)=0;   % Time array
Theta1(1)=0.5; % Initial position of pendulum 1

w2(1:N)=0;  %Angular velocity 2 array
Theta2(1:N)=0;  %Angular coordinate 2 array

Theta2(1)=0.9; %Initial position of pendulum 2

for i=1:N-1
    w1(i+1)=w1(i)-(g/L1)*Theta1(i)*dt;
    Theta1(i+1)=Theta1(i)+w1(i+1)*dt;
    
    w2(i+1)=w2(i)-(g/L2)*Theta2(i)*dt;
    Theta2(i+1)=Theta2(i)+w2(i+1)*dt;

    X1(i)=L1*sin(Theta1(i)); % polar to cartesian
    Y1(i)=-L1*cos(Theta1(i));
    
    t(i+1)=t(i)+dt;

    X(i)=L1*sin(Theta1(i))+L2*sin(Theta2(i));
    Y(i)=-L1*cos(Theta1(i))-L2*cos(Theta2(i));


end
X(100)=X(99);
Y(100)=Y(99);

 %-----------------------------------------------------------------------
 %---Energy Calculations-------------------------------------------------
 %----------------------------------------------------------------------
  X1(N)=L1*sin(Theta1(N)); 
  Y1(N)=-L1*cos(Theta1(N));

  T=0.5*M1*(L1^2)*(w1.^2); % Kinetic energy (T)
  T=T/max(T); % normalized Kinetic energy (T)
  
  V=(M1*g*Y1); % potential energy (V)
  V=V/max(V); % normalized potential energy (V)
  
  E=T+V; % total normalized energy (E)
  
  T2=0.5*M2*(L2^2)*(w2.^2);
  V2=(M2*g*Y);
  E2=T2+V2;

% plotting/animation of results
  
for i=1:N
    figure(1)
    subplot(121)
    plot(X1(i),Y1(i),'.',X(i),Y(i),'*','markersize',25); 
    axis([-1.5 1.5  -2.05 2.05]);
    line([0 X1(i)], [0 Y1(i)],'Linewidth',2);
    line([X1(i),X(i)],[Y1(i),Y(i)],'Linewidth',2);
    xlabel('X '); 
    ylabel('Y'); 
    titlestring = ['pendulum motion at t =',num2str(i*dt), 'seconds'];
    title(titlestring ,'fontsize',14);                            
    h=gca; 
    get(h,'FontSize') ;
    set(h,'FontSize',14);
    fh = figure(1);
    set(fh, 'color', 'white'); 
    
    subplot(122)
    plot(t(i),T(i),'.','markersize',15,'MarkerEdgeColor','b')
    hold on
    plot(t(i),V(i),'.','markersize',15,'MarkerEdgeColor','r')
    hold on 
    plot(t(i),T(i)+V(i),'.','markersize',15,'MarkerEdgeColor','k')
    
    line([2.3 2.7], [0.6 0.6],'color','r','Linewidth',2)
    text(2.4,0.63,'V','fontSize',12)
    line([2.3 2.7], [0.5 0.5],'color','b','Linewidth',2)
    text(2.4,0.53,'T','fontSize',12)
    line([2.3 2.7], [0.4 0.4],'color','k','Linewidth',2)
    text(2.4,0.43,'E','fontSize',12)
    
    title('Energy vs time' ,'fontsize',14);  
    xlabel('time ','fontsize',14); 
    ylabel('energy','fontsize',14); 
    axis([ 0 3 -2.1 2.1])
    h=gca; 
    get(h,'FontSize') ;
    set(h,'FontSize',14);
    fh = figure(1);
    set(fh, 'color', 'white');  
    Yr=getframe;
end
 
 movie(Yr)