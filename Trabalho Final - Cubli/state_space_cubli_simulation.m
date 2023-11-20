
tspan = [0 3];

phi_s = acos(-sqrt(3)/3);
phi_u = acos(sqrt(3)/3);

% q_0s = [cos(phi_s/2) (-sqrt(2)/2)*sin(phi_s/2) (sqrt(2)/2)*sin(phi_s/2) 0 0 0 0];
% q_0u = [cos(phi_u/2) (sqrt(2)/2)*sin(phi_u/2) (-sqrt(2)/2)*sin(phi_u/2) 0 0 0 0];
% 
ops = odeset('MaxStep', 1e-5);
% 
% %Modelo não linear---------------------------------------------------------
% 
% [t1s,q1s] = ode45(@fnl, tspan, q_0s, ops); 
% [t1u,q1u] = ode45(@fnl, tspan, q_0u, ops);
% 
% figure(1)
% plot(t1s,q1s(:,1))
% hold on
% plot(t1s,q1s(:,2))
% hold on
% plot(t1s,q1s(:,3))
% hold on
% plot(t1s,q1s(:,4))
% legend("q_0","q_1","q_2","q_3")
% xlabel("tempo (s)")
% ylabel("quaternions")
% title("Quaternions na situação de equilíbrio estável (Modelo não linear)")
% 
% figure(2)
% plot(t1u,q1u(:,1))
% hold on
% plot(t1u,q1u(:,2))
% hold on
% plot(t1u,q1u(:,3))
% hold on
% plot(t1u,q1u(:,4))
% legend("q_0","q_1","q_2","q_3")
% xlabel("tempo (s)")
% ylabel("quaternions")
% title("Quaternions na situação de equilíbrio instável (Modelo não linear)")
% 
% figure(3)
% plot(t1s,q1s(:,5))
% hold on
% plot(t1s,q1s(:,6))
% hold on
% plot(t1s,q1s(:,7))
% legend("w_x","w_y","w_z")
% xlabel("tempo (s)")
% ylabel("Velocidade angular (rad/s)")
% ylabel("Velocidade ângular (rad/s)")
% title("Velocidade angular na situação de equilíbrio estável (Modelo não linear)")
% 
% figure(4)
% plot(t1u,q1u(:,5))
% hold on
% plot(t1u,q1u(:,6))
% hold on
% plot(t1u,q1u(:,7))
% legend("w_x","w_y","w_z")
% xlabel("tempo (s)")
% ylabel("Velocidade ângular (rad/s)")
% title("Velocidade angular na situação de equilíbrio instável (Modelo não linear)")

%Modelo linear---------------------------------------------------------

q_0lu = [(sqrt(2)/2)*sin(phi_u/2) (-sqrt(2)/2)*sin(phi_u/2) 0 1 1 1];

[tlu,qlu] = ode45(@fl, tspan, q_0lu, ops);

figure(5)
plot(tlu,qlu(:,1))
hold on
plot(tlu,qlu(:,2))
hold on
plot(tlu,qlu(:,3))
legend("q_1","q_2","q_3")
xlabel("tempo (s)")
ylabel("quaternions")
title("Quaternions na situação de equilíbrio instável (Modelo linear)")

figure(6)
plot(tlu,qlu(:,4))
hold on
plot(tlu,qlu(:,5))
hold on
plot(tlu,qlu(:,6))
legend("w_x","w_y","w_z")
xlabel("tempo (s)")
ylabel("Velocidade ângular (rad/s)")
title("Velocidade angular na situação de equilíbrio instável (Modelo linear)")

%Espaço de estados (modelo não linearizados)
function dy = fnl(t,q)
    Tau_x = 0;
    Tau_y = 0;
    Tau_z = 0;
    dy_1 = 1/2*(-q(2)*q(5) - q(3)*q(6) - q(4)*q(7));
    dy_2 = 1/2*(q(1)*q(5) - q(4)*q(6) + q(3)*q(7));
    dy_3 = 1/2*(q(4)*q(5) + q(1)*q(6) - q(2)*q(7));
    dy_4 = 1/2*(-q(3)*q(5) + q(2)*q(6) + q(1)*q(7));
    dy_5 = 4875.31*(-0.00801894*q(1)^2 + 0.0160379*q(1)*q(2) + 0.00801894*q(2)^2 + 0.00801894*q(3)^2 + 0.0160379*q(3)*q(4) - 0.00801894*q(4)^2 + 0.027945*Tau_x + 0.012375*Tau_y + 0.012375*Tau_z) - 0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2*q(6) + 0.234842*q(6)^2 + q(5)*(-0.00175975*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 + 0.234842*q(6) - 0.234842*q(7)) - 0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2*q(7) - 0.234842*q(7)^2;
    dy_6 = 4875.31*(0.00801894*q(1)^2 - 0.00801894*q(2)^2 + 0.0160379*q(1)*q(3) - 0.00801894*q(3)^2 - 0.0160379*q(2)*q(4) + 0.00801894*q(4)^2 + 0.012375*Tau_x + 0.027945*Tau_y + 0.012375*Tau_z) - 0.234842*q(5)^2 + q(5)*(-0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 - 0.234842*q(6)) + q(6)*(-0.00175975*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 + 0.234842*q(7)) - 0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2*q(7) + 0.234842*q(7)^2;
    dy_7 = 2437.65*(-0.0320758*q(1)*(q(2) + q(3)) + 0.0320758*q(2)*q(4) + 0.3*(-0.106919*q(3)*q(4) + 0.0825*(Tau_x + Tau_y)) + 0.04239*Tau_z) + 0.234842*q(5)^2 - 0.234842*q(6)^2 + q(6)*(-0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 - 0.234842*q(7)) + q(5)*(-0.00102745*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2 + 0.234842*q(7)) - 0.00175975*(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2)^2*q(7);
    dy = [dy_1;dy_2;dy_3;dy_4;dy_5;dy_6;dy_7];
end

%Espaço de estados (modelo não linearizados)
 function dy = fl(t,q)
     phi_u = acos(sqrt(3)/3);
     Tau_x = 0; 
     Tau_y = 0;
     Tau_z = 0;
     q00 = cos(phi_u/2);
     q01 = (sqrt(2)/2)*sin(phi_u/2);
     q02 = (-sqrt(2)/2)*sin(phi_u/2);
     q03 = 0;
     q00_0 = 1;
     dy_1 = 1/2*(q00*q(4)-q03*q(5) + q02*q(6));
     dy_2 = 1/2*(q03*q(4) + q00*q(5)-q01*q(6));
     dy_3 = 1/2*(-q02*q(4) + q01*q(5) + q00*q(6));
     dy_4 = 4875.31*(-0.00759662*q00^2+0.0151932*q00*q01+0.00759662*q01^2+0.00759662*q02^2+0.0151932*q02*q03-0.00759662*q03^2-0.0151932*q00*q00_0+0.0151932*q01*q00_0+0.0151932*q00*q(1)+0.0151932*q01*q(1)+0.0151932*q02*q(2)+0.0151932*q03*q(2)+0.0151932*q02*q(3)-0.0151932*q03*q(3)+0.027125*Tau_x+0.00041*(-1.03005*(q00^2-2*q00*q01-q01^2-q02^2-2*q02*q03+q03^2+2*(q00-q01)*q00_0-2*(q00+q01)*q(1)-2*(q02+q03)*q(2)+2*(-q02+q03)*q(3))+2*Tau_x)+0.012375*Tau_y+0.012375*Tau_z)-0.00175975*(q00^2+q01^2+q02^2+q03^2)^2*q(4)-0.00102745*(q00^2+q01^2+q02^2+q03^2)^2*q(5)-0.00102745*(q00^2+q01^2+q02^2+q03^2)^2*q(6);
     dy_5 = 4875.31*(0.00759662*q00^2-0.00759662*q01^2+0.0151932*q00*q02-0.00759662*q02^2-0.0151932*q01*q03+0.00759662*q03^2+0.0151932*q00*q00_0+0.0151932*q02*q00_0-0.0151932*q01*q(1)-0.0151932*q03*q(1)+0.0151932*q00*q(2)-0.0151932*q02*q(2)-0.0151932*q01*q(3)+0.0151932*q03*q(3)+0.012375*Tau_x+0.027125*Tau_y+0.00041*(1.03005*(q00^2-q01^2+2*q00*q02-q02^2-2*q01*q03+q03^2+2*(q00+q02)*q00_0-2*(q01+q03)*q(1)+2*(q00-q02)*q(2)+2*(-q01+q03)*q(3))+2*Tau_y)+0.012375*Tau_z)-0.00102745*(q00^2+q01^2+q02^2+q03^2)^2*q(4)-0.00175975*(q00^2+q01^2+q02^2+q03^2)^2*q(5)-0.00102745*(q00^2+q01^2+q02^2+q03^2)^2*q(6);
     dy_6 = -4875.31*(0.0151932*q00*q01+0.0151932*q00*q02-0.0151932*q01*q03+0.0151932*q02*q03+0.0151932*q01*q00_0+0.0151932*q02*q00_0+0.0151932*q00*q(1)-0.0151932*q03*q(1)+0.0151932*q00*q(2)+0.0151932*q03*q(2)-0.0151932*q01*q(3)+0.0151932*q02*q(3)-0.012375*Tau_x-0.012375*Tau_y+0.00082*(1.03005*(q00*(q01+q02)+(-q01+q02)*q03+(q01+q02)*q00_0+(q00-q03)*q(1)+(q00+q03)*q(2)+(-q01+q02)*q(3))-Tau_z)-0.020375*Tau_z)-0.00102745*(q00^2+q01^2+q02^2+q03^2)^2*q(4)-0.00102745*(q00^2+q01^2+q02^2+q03^2)^2*q(5)-0.00175975*(q00^2+q01^2+q02^2+q03^2)^2*q(6);
     dy = [dy_1;dy_2;dy_3;dy_4;dy_5;dy_6];
 end
