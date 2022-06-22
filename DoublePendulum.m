clear
close all
global m1 m2 L1 L2 g

n = 5; %number of double pendulms to be simulated
step = 0.01; %step size
T=0:step:10; %time vector
trail = 200; %trail size

%initial conditions
d_theta1_0=-2;
d_theta2_0=-1;
theta1_0=pi/2;
theta2_0=pi/2;

phi = 0.1; %initial phase offset between each pendulum

%simulation parameters
m1=10;
m2=0.5;
L1=2;
L2=0.7;
g=9.81;

%simulate each pendulum 
for i=1:n
    [x1(i,:),y1(i,:),x2(i,:),y2(i,:)] = DP_eval_position(T);
    theta1_0 = theta1_0 +phi;
    theta2_0 = theta2_0 +phi;

end

%plot
for j=1:T(end)/step
    hold off;
    for i =1:n
            plot([0 x1(i,j)], [0 y1(i,j)],'linewidth',2,'Color',[0 0 0]);
            hold on;
            plot([x1(i,j) x2(i,j)], [y1(i,j) y2(i,j)],'linewidth',2,'Color',[0 0 0]);
            plot(x1(i,j),y1(i,j),'o','Color',[1 0 0],'MarkerFaceColor',[1 0 0],'linewidth',8);
            plot(x2(i,j),y2(i,j),'o','Color',[0 0 1],'MarkerFaceColor',[0 0 1],'linewidth',8);
            axis([(-L1-L2), (L1+L2), (-L1-L2-L2/2), L1+L2-L2/2]);
            
            %trail
             if j-trail>0
                plot(x1(i, j-trail:j ), y1(i, j-trail:j ),'linewidth',1,'Color',[1 0 0]);
                plot(x2(i, j-trail:j ), y2(i, j-trail:j ),'linewidth',1,'Color',[0 0 1]);
            else
                plot(x1(i, 1:j),y1(i, 1:j),'linewidth',1,'Color',[1 0 0]);
                plot(x2(i, 1:j),y2(i, 1:j),'linewidth',1,'Color',[0 0 1]);
             end
    
    end
    drawnow;
end
