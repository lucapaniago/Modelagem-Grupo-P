%%Script para simulação dinâmica e cinemática do Cubli
clc
clear
b = 17.03*10^(-6);
Tau = [0; 0; 0];
g = [0;0;-9.81];
mc = 0.55;
%q00 = [sqrt(2*(3-sqrt(3))/3)/2;-sqrt((3+sqrt(3))/3)/2;sqrt((3+sqrt(3))/3)/2;0 ];
%q00 = [1;0;0;0];
w00 =[0;0;0];
Ic = [0.00919625 -0.00309375 -0.00225;
     -0.00309375 0.0082675 -0.00309375;
     -0.00225 -0.00309375 0.00919625];
Ic_inv = inv(Ic);
rc = [0.0954545;0.0954545;0.095454];

open modelagem_2021a.slx



% q = out.logsout{2}.Values;
% wc = out.logsout{1}.Values;
% figure(1)
% plot(q.Time,q.Data)
% 
% hold off
% figure(2)
% plot(wc.Time,wc.Data)
% legend("\omega_x","\omega_y","\omega_z")
% ylabel("Velocidade Angular [rad/s]")
% xlabel("Tempo [s]")