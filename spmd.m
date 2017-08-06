function xdot = spmd(t, x) % Standard form xdot = Ax + Bu
  
  pos = x(1); 
  vel = x(2);
  k = 5;
  c = 0;
  mass = 3;
 
  acc = (-k*pos - c*vel)/mass;
  
  xdot(1) = vel;
  xdot(2) = acc;