%%Script para simulação dinâmica e cinemática do Cubli
clc
clear
b = 17.03*10^(-6);
%b = 0;
Tau = [0;0;0];
g = [0;0;-9.81]; 
mc = 0.55;
phi_s = acos(-sqrt(3)/3);
phi_u = acos(sqrt(3)/3);
e_s = [-sqrt(2)/2;sqrt(2)/2;0];
e_u = [sqrt(2)/2;-sqrt(2)/2;0];

q00 = [cos(phi_u/2);e_u*sin(phi_u/2)];
%q00 = [cos((phi_u - (10 * pi/180))/2);e_u*sin(((phi_u - 10*pi/180))/2)]; %posição de equilíbrio instável
%q00 =[cos(phi_s/2);e_s*sin(phi_s/2)]; %posição de equilíbrio estável
%q00 = [1;0;0;0];
w00 = [0;0;0];
%w00 =2*pi/sqrt(3)*[1;1;1];
Ic = [0.01008 -0.00309375 -0.00309375;
    -0.00309375 0.01008 -0.00309375;
    -0.00309375 -0.00309375 0.01008];

  
Ic_inv = inv(Ic);
rc = [0.0954545;0.0954545;0.0954545];


%State Space Properties
A = [[0.	0.	0.	0.444037	0.	-0.162529];
[0.	0.	0.	0.	0.444037	-0.162529];
[0.	0.	0.	0.162529	0.162529	0.444037];
[94.8542	-25.4161	-25.4161	-0.00175975	-0.00102745	-0.00102745];
[-25.4161	94.8542	-25.4161	-0.00102745	-0.00175975	-0.0010274];
[-69.4381	-69.4381	50.8322	-0.00102745	-0.00102745	-0.00175975]];
B = [[0.	0.	0.];
    [0.	0.	0.];
    [0.	0.	0.];
    [136.24	60.3319	60.3319];
    [60.3319	136.24	60.3319];
    [60.3319	60.3319	103.332]];
C = ones(6);
D = zeros(6,3);
q00L = [q00(2);q00(3);q00(4)];
open modelagem_2021a_2.slx



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

% eul = out.logsout{3}.Values
% figure(3)
% plot(eul.Time,eul.Data,"o")
% legend("\psi","\theta","\phi")
% ylabel("Ângulos de Euler (ZYZ) [°]")
% xlabel("Tempo [s]")

