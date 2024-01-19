%% Model a Planar Pendulum
% Consider a point mass _m_ suspended by a massless rod of length _l_ under the influence of gravity. The position of the mass can be expressed in in Cartesian coordinates by _(x,y)_. 
% 
% 
% <<../pendulum.png>>
%% Modeling the System
% A force balance of the mass gives the equations of motion in the _x_ and _y_ directions. 
%
% $$
% \begin{array}{rclccr}
% m\ddot{x}&=&F\sin\theta&&(1)\\
% m\ddot{y} + F\cos\theta&=&-mg&&(2)\\
% \end{array}
% $$
%
% Let _(u, v)_ be the velocities in _(x, y)_ respectively. The system can
% be rewritten as a system of first order ODEs
%
% $$
% \begin{array}{rclccr}
% \dot{x} &=&u&&(3)\\
% \dot{u}&=&-F\frac{x}{ml}&&(4)\\
% \dot{y} &=&v&&(5)\\
% \dot{v} &=&-F\frac{y}{ml} - g&&(6)    
% \end{array}
% $$
% 
% where _F_ is the tension in the rod. The system also possesses the geometric constraint 
% 
% $$\begin{array}{rclccr}x^2 + y^2 &=& l^2&&(7)\end{array}$$
%
% Differentiate (7) twice with respect to time _t_ to arrive at 
% 
% $$ 
% \begin{array}{rclccr}
% m(u^2 + v^2) -Fl-mgy&=&0&&(8)
% \end{array}
% $$
%
% This relationship is useful since it allows _F_ to determined at every
% step for use in modeling the kinematics of the system. 
%% Simulating the System 
% The system is simulated as shown in the figure below
%
open_system('pendulum');
%%
% Equation (8) contains one unknown _F_ and is of the form _f(z) = 0_ where
% $f(z) = m(u^2+v^2)-Fl-mgy$. The Algebraic Constraint block constrains
% _f(z)_ to 0 and solves for _F_ in accordance with (8). 
out=sim('pendulum');
t=out.get('t');Y=out.get('y');
x=Y(:,1);
y=Y(:,2);
u=Y(:,3);
v=Y(:,4);
F=Y(:,5);
% 
% 
%%      
%      
%     
%    
figure;
%
plot(t,x,'-b',t,u,'-.r','linewidth',1);
g=legend('$x$','$u$');
set(g,'interpreter','latex','fontsize',12,'location','best');
grid on;
xlabel('t');
ylabel('(x, u)');
h=title('Position and velocity in \emph{x} over time');set(h,'interpreter','latex')
%
% 
figure;
%
plot(t,y,'-b',t,v,'-.r','linewidth',1);
xlabel('t');
ylabel('(y, v)');
g=legend('$y$','$v$');
set(g,'interpreter','latex','FontSize',12,'location','best');
grid on;
h=title('Position and velocity in \emph{y} over time');
set(h,'interpreter','latex');
%
%% References
% Hairer, Ernst, Christian Lubich, and Michel Roche. "The Numerical Solution Of Differential-Algebraic Systems By Runge-Kutta Methods." _Lecture Notes in Mathematics._ Vol. 1409, Berlin: Springer-Verlag, 1989: pp. 8-9.
