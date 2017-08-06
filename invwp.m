
function dtheta = invwp(t, th)

  theta_link = th(1);
  theta_link_des = pi/2;
  vel_link = th(2);
  vel_link_des = 0;
  theta_wheel = th(3);
  vel_wheel = th(4);
  I_1 = 0.0075;
  I_2 = I_1*2.25;
  m = 1;
  M = 1.5;
  M_eq = (0.5*m + M);
  l_1 = 0.3;
  g = 9.8;
  kp = 12;
  kd = 5;

  torque = -kp*(theta_link - theta_link_des) - kd*(vel_link - vel_link_des);
  
  E_1 = I_1 + m*0.25*(l_1)^2 + I_2 + M*(l_1)^2;
  E_2 = [M_eq*g*l_1*cos(theta_link);0];
  CM = [E_1 -I_2; -I_2 I_2];
  Torque = [0;torque];
  
  K = inv(CM)*[Torque - E_2];
  
  dtheta(1,1) = vel_link;  
  dtheta(2,1) = K(1);
  dtheta(3,1) = vel_wheel; 
  dtheta(4,1) = K(2);
 
 

  
  
  
  