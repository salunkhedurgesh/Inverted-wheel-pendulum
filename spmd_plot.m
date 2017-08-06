[t,x] = ode45('spmd', [0,10], [1, 0]);

plot(t, x(:,1));
hold on;
plot(t, x(:,2), 'r');
hold on;
