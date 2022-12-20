syms q1 q2 q1_dot q2_dot q1_dotdot q2_dotdot;

D_q=[328/3+50*cos(q2), 175/6+25*cos(q2); 175/6+25*cos(q2),... 
181/6]*[q1_dotdot; q2_dotdot];
C_q=[50*q1_dot.*q2_dot*sin(q2)+25*q2_dot.^2*sin(q2);-...
25*q1_dot.^2*sin(q2)];
F_q=[10.142*q1_dot+0.1*sign(q1_dot); 
10.134*q2_dot+0.11*sign(q2_dot)];
G_q=[735.75*cos(q1)+245.25*cos(q1+q2);245.25*cos(q1+q2)];
torque(q1,q2,q1_dot,q2_dot,q1_dotdot,q2_dotdot)=D_q+C_q+F_q+G_q;
%First, I calculated the torque matrix as symbolic, after that I inserted the position, velocity and 
%acceleration values.
t=0:0.1:5;
q1_dotdot=0;
q2_dotdot=0;
q1=pi/30*t;
q2=pi/15*t;
q1_dot=(pi/30*ones(length(t),1))';
q2_dot=(pi/15*ones(length(t),1))';
res=torque(q1,q2,q1_dot,q2_dot,q1_dotdot,q2_dotdot);
x=cell2sym(res);
figure(1)
subplot(1,2,1);cla;hold on;grid on;title('Position');xlabel('time');ylabel('q1 q2');ax1=gca;
plot(ax1,t,q1,'LineWidth',2);hold on;grid on;
plot(ax1,t,q2,'LineWidth',2);hold on;
subplot(1,2,2);cla;hold on;grid on;title('Velocity');xlabel('time');ylabel('q1dot q2dot');ax2=gca;
plot(ax2,t,q1_dot,'LineWidth',2);hold on;grid on;
plot(ax2,t,q2_dot,'LineWidth',2);hold on;
legend('q1','q2');
figure(2)
plot(t,x,'LineWidth',2);hold on;grid on;title('Torque vs Time');xlabel('time(s)');ylabel('Torque(Nm)');
legend('torque1','torque2')