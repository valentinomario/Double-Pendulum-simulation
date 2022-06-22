%system model used in the simulation
function theta_vett=pendulum_model(input)
theta1 = input(1);
theta2 = input(2);
d_theta1 = input(3);
d_theta2 = input(4);
u = input(5);

global m1 m2 L1 L2 g
a11=(m1+m2)*L1^2;
a12=m2*L1*L2*cos(theta1-theta2);
b1=m2*L2*L1*d_theta2^2*sin(theta2-theta1)-(m1+m2)*g*L1*sin(theta1)+u*L1*cos(theta1);
a21=m2*L2*L1*cos(theta1-theta2);
a22=m2*L2^2;
b2=-m2*L1*L2*sin(theta2-theta1)*d_theta1^2-m2*g*L2*sin(theta2)+u*L2*cos(theta2);
A=[a11 a12;a21 a22];
B=[b1;b2];
theta_vett=A\B;

end

