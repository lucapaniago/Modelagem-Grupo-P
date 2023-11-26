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

%q00 = [cos(phi_u/2);e_u*sin(phi_u/2)]; %posição de equilíbrio instável
q00 = [cos((phi_u - (10 * pi/180))/2);e_u*sin(((phi_u - 10*pi/180))/2)]; 
%q00 =[cos(phi_s/2);e_s*sin(phi_s/2)]; %posição de equilíbrio estável

w00 =20*pi/sqrt(3)*[1;1;1];
%w00 = [38.47;38.47;39.4];
Ic = [0.01008 -0.00309375 -0.00309375;
    -0.00309375 0.01008 -0.00309375;
    -0.00309375 -0.00309375 0.01008];
Ic_inv = inv(Ic);
rc = [0.0954545;0.0954545;0.0954545];
%Sistema de Coordenadas pião

v = eig(Ic);
Ic_p = [v(2) 0 0 ; 0 v(3) 0 ; 0 0 v(1)]; 
r0 = [0;0;1];
theta = 10*pi/180;
r1 = [sin(theta);0;cos(theta)];
e = cross(r0,r1)/norm(cross(r0,r1));
phi_p = acos(dot(r0,r1)/(norm(r0)*norm(r1)));
q00_p = [cos(phi_p/2);e*sin(phi_p/2)];
%q00_p = [1;0;0;0]; 
w00_p = [0;0;20*pi];
  
Ic_pinv = inv(Ic_p);
rc = [0.0954545;0.0954545;0.0954545];
rc_p = [0;0;norm(rc)]; 
Tau_p = Tau;


open modelagem_2021a_2.slx

