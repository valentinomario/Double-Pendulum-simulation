%simulates the position (cartesian coordinates) of the two masses
function [x1,y1,x2,y2]=DP_eval_position(T)
global m1 m2 L1 L2 g


out = sim('DP_sim',T);

theta1 = out.theta1.signals.values;
theta2 = out.theta2.signals.values;

x1 = L1*sin(theta1);
x2 = L1*sin(theta1) + L2*sin(theta2);
y1 = -L1*cos(theta1);
y2 = - L2*cos(theta2) - L1*cos(theta1);

end