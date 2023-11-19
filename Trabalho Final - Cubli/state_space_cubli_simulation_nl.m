
%<<<<<<< HEAD
tspan = [0 3];
phi_u = acos(sqrt(3)/3);
e_u = [sqrt(2)/2,-sqrt(2)/2,0];
q_0 = [cos(phi_u/2) e_u*sin(phi_u/2) 0 0 0];
%q_0 = [1 0 0 0 0 0 0];
%=======
tspan = 0:0.001:10;

phi_s = acos(-sqrt(3)/3);
phi_u = acos(sqrt(3)/3);

q_0s = [cos(phi_s/2) (-sqrt(2)/2)*sin(phi_s/2) (sqrt(2)/2)*sin(phi_s/2) 0 0 0 0];
q_0u = [cos(phi_u/2) (sqrt(2)/2)*sin(phi_u/2) (-sqrt(2)/2)*sin(phi_u/2) 0 0 0 0];

ops = odeset('MaxStep', 1e-5);

%Modelo não linear---------------------------------------------------------

[t1s,q1s] = ode45(@fnl, tspan, q_0s, ops); 
[t1u,q1u] = ode45(@fnl, tspan, q_0u, ops);

figure(1)
plot(t1s,q1s(:,1))
hold on
plot(t1s,q1s(:,2))
hold on
plot(t1s,q1s(:,3))
hold on
plot(t1s,q1s(:,4))
legend("q_0","q_1","q_2","q_3")
xlabel("tempo (s)")
ylabel("quaternions")
% q = [q1(:,1) q1(:,2)  q1(:,3) q1(:,4)];
% figure(2)
% for i = 1:length(q1(:,1))
%    plot(t1, norm(q(i,:)))
%    hold on
% end

%=======
title("Quaternions na situação de equilíbrio estável (Modelo não linear)")

figure(2)
plot(t1u,q1u(:,1))
hold on
plot(t1u,q1u(:,2))
hold on
plot(t1u,q1u(:,3))
hold on
plot(t1u,q1u(:,4))
legend("q_0","q_1","q_2","q_3")
xlabel("tempo (s)")
ylabel("quaternions")
title("Quaternions na situação de equilíbrio instável (Modelo não linear)")

figure(3)
plot(t1s,q1s(:,5))
hold on
plot(t1s,q1s(:,6))
hold on
plot(t1s,q1s(:,7))
legend("w_x","w_y","w_z")
xlabel("tempo (s)")
ylabel("Velocidade angular (rad/s)")
ylabel("Velocidade ângular (rad/s)")
title("Velocidade angular na situação de equilíbrio estável (Modelo não linear)")

figure(4)
plot(t1u,q1u(:,5))
hold on
plot(t1u,q1u(:,6))
hold on
plot(t1u,q1u(:,7))
legend("w_x","w_y","w_z")
xlabel("tempo (s)")
ylabel("Velocidade ângular (rad/s)")
title("Velocidade angular na situação de equilíbrio instável (Modelo não linear)")

function dy = fnl(t,q)
    T_x = 0;
    T_y = 0;
    T_z = 0;
    dy_1 = 1/2*(-q(2)*q(5) - q(3)*q(6) - q(4)*q(7));
    dy_2 = 1/2*(q(1)*q(5) - q(4)*q(6) + q(3)*q(7));
    dy_3 = 1/2*(q(4)*q(5) + q(1)*q(6) - q(2)*q(7));
    dy_4 = 1/2*(-q(3)*q(5) + q(2)*q(6) + q(1)*q(7));
    dy_5 = 4875.31*(-0.00801894*q(1)^2 + 0.0160379*q(1)*q(2) + 0.00801894*q(2)^2 + 0.00801894*q(3)^2 + 0.0160379*q(3)*q(4) - 0.00801894*q(4)^2 + 0.027945*T_x + 0.012375*T_y + 0.012375*T_z) - 0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2*q(6) + 0.234842*q(6)^2 + q(5)*(-0.00175975*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 + 0.234842*q(6) - 0.234842*q(7)) - 0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2*q(7) - 0.234842*q(7)^2;
    dy_6 = 4875.31*(0.00801894*q(1)^2 - 0.00801894*q(2)^2 + 0.0160379*q(1)*q(3) - 0.00801894*q(3)^2 - 0.0160379*q(2)*q(4) + 0.00801894*q(4)^2 + 0.012375*T_x + 0.027945*T_y + 0.012375*T_z) - 0.234842*q(5)^2 + q(5)*(-0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 - 0.234842*q(6)) + q(6)*(-0.00175975*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 + 0.234842*q(7)) - 0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2*q(7) + 0.234842*q(7)^2;
    dy_7 = 2437.65*(-0.0320758*q(1)*(q(2) + q(3)) + 0.0320758*q(2)*q(4) + 0.3*(-0.106919*q(3)*q(4) + 0.0825*(T_x + T_y)) + 0.04239*T_z) + 0.234842*q(5)^2 - 0.234842*q(6)^2 + q(6)*(-0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 - 0.234842*q(7)) + q(5)*(-0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 + 0.234842*q(7)) - 0.00175975*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2*q(7);
    dy = [dy_1;dy_2;dy_3;dy_4;dy_5;dy_6;dy_7];
end

