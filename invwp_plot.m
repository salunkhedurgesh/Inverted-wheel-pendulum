[t, th] = ode45('invwp', [0,20], [1.5;0;0;0]);
%[dtheta]=invwp(t,th);

figure(1)
plot(t, th(:,1));

figure(2)
plot(t, (th(:,4)*30)/pi, 'r');


% Animating

l_1=0.3;
l_2=0.1;
for i=1:le
    %state variables
    angle_link = th(i,1);
    %co-ordinates of fixed pivot
    x0=0;
    y0=0;
    %co-ordinates of end effector
    y1=l_1*sin(angle_link);
    x1=l_1*cos(angle_link);
    %
    xx=[x0 x1];
    yy=[y0 y1];
    
    wheel_x = x1 + l_2 * cos(th(i,3));
    wheel_y = y1 + l_2 * sin(th(i,3));
    x_circle = [x1 wheel_x];
    y_circle = [y1 wheel_y];
    
%     wheel_x2 = x1 - l_2 * cos(th(i,3));
%     wheel_y2 = y1 + l_2 * sin(th(i,3));
%     x_circle2 = [x1 wheel_x2];
%     y_circle2 = [y1 wheel_y2];
    
    wheel_x3 = x1 - l_2 * cos(th(i,3));
    wheel_y3 = y1 - l_2 * sin(th(i,3));
    x_circle3 = [x1 wheel_x3];
    y_circle3 = [y1 wheel_y3];
%     
%     wheel_x4 = x1 + l_2 * cos(th(i,3));
%     wheel_y4 = y1 - l_2 * sin(th(i,3));
%     x_circle4 = [x1 wheel_x4];
%     y_circle4 = [y1 wheel_y4];
    % Animating
    figure(3)
    plot(xx,yy);
    hold on;
    plot(x_circle, y_circle);
    hold on;
%     plot(x_circle2, y_circle2);
%     hold on;
    plot(x_circle3, y_circle3);
%     hold on;
%     cirlce(x1, y1);
%     hold on;
%     plot(x_circle4, y_circle4);
    hold off;
    grid on;
    set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
    axis([-1 1 -1 1])
    xlabel('X (m)','FontSize',10);
    ylabel('Y (m)','FontSize',10);
    pause(0.01)
    drawnow;
end
