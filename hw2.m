clear;clc;
syms q1 q2 q3 q4 q5 q6;
q=[q1 q2 q3 q4 q5 q6];
a=[180 600 120 0 0 0]*0.001;%meter
alpha=[90 180 -90 90 -90 0];%degree
d=[400 0 0 620 0 115]*0.001;%meter
o0=[0;0;0];
% theta=[0 0 0 0 0 0];%degree
% theta=[-90 70 160 300 100 -120];%degree
% theta=[-50 100 0 120 150 20];%degree

T=eye(4);

for i=1:1%6 DOF
A=[cosd(q(i)), -sind(q(i))*cosd(alpha(i)), sind(q(i))*sind(alpha(i)), a(i)*cosd(q(i));
    sind(q(i)), cosd(q(i))*cosd(alpha(i)), -cosd(q(i))*sind(alpha(i)), a(i)*sind(q(i));
    0, sind(alpha(i)), cosd(alpha(i)), d(i);
    0, 0, 0, 1];
T=T*A;

z=T(1:3,3);
o=T(1:3,4);
end

R=T(1:3,1:3)
P=T(1:3,4)
J=[z(1)*(p(7)-p(1)) z(2)*(p(7)-p(2)) z(3)*(p(7)-p(3)) z(4)*(p(7)-p(4)) z(5)*(p(7)-p(5)) z(6)*(p(7)-p(6));z(0) z(1) z(2) z(3) z(4) z(5) z(6)]


% x=forward_kinematic(1,4);
% y=forward_kinematic(2,4);
% z=forward_kinematic(3,4);
% t1 = 0:0.01:1;
% Tx = subs(x,t,t1);
% plot(t1,Tx,'Linewidth',2);hold on
% Ty = subs(y,t,t1);
% plot(t1,Ty,'Linewidth',2);hold on
% Tz = subs(z,t,t1);
% plot(t1,Tz,'Linewidth',2);hold on;grid on
% ylabel('position (m)');
% xlabel('time(s)');
% title('Point trajectories wrt base frame')
% legend('x','y','z')

