    %Item g)-------------------------------------------------------------------
%Condição inicial C1

tspan = 0:0.001:10;
%C1
y_01 = [0 0.2 0 0];
%Linearizada
[t1,y1] = ode45(@f1, tspan, y_01); %linearizado ode45
%Não linearizada
[t2,y2] = ode45(@f2, tspan, y_01); %N linearizado ode45
%Linearizada
[t3,y3] = ode23t(@f1, tspan, y_01); %linearizado ode23t
%Não linearizada
[t4,y4] = ode23t(@f2, tspan, y_01); %N linearizado ode23t

%Equações linearizada e não linearizada para ode45
figure(1)
subplot(2,1,1);
plot(t1,y1(:,1),"b")
hold on
plot(t2,y2(:,1),"r")
legend("Linearizada", "Não Linearizada")
xlabel("tempo [s]")
ylabel("\theta_1 [rad]")
title("\theta_1 utilizando o Método de Runge-Kutta na condição C1")

subplot(2,1,2);
plot(t1,y1(:,2),"b")
hold on
plot(t2,y2(:,2),"r")
legend("Linearizada", "Não Linearizada")
xlabel("tempo [s]")
ylabel("\theta_2 [rad]")
title("\theta_2 utilizando o Método de Runge-Kutta na condição C1")
%Erro
figure(2)
subplot(2,1,1);
plot(t1,abs(y1(:,1)-y2(:,1)),"r")
xlabel("tempo [s]")
ylabel("|\theta_1_{lin} - \theta_1_{Ñlin}| [rad]")
title("Diferença de \theta_1 entre modelo linearizado e não linearizado para método de Range-Kutta (C1)")

subplot(2,1,2);
plot(t1,abs(y1(:,2)-y2(:,2)),"r")
xlabel("tempo [s]")
ylabel("|\theta_2_{lin} - \theta_2_{Ñlin}| [rad]")
title("Diferença de \theta_2 entre modelo linearizado e não linearizado (C1)")

%Equações linearizada e não linearizada para ode23t
figure(3)
subplot(2,1,1);
plot(t3,y3(:,1),"b")
hold on
plot(t4,y4(:,1),"r")
legend("Linearizada", "Não Linearizada")
xlabel("tempo [s]")
ylabel("\theta_1 [rad]")
title("\theta_1 utilizando o Método dos Trapézios na condição C1")
subplot(2,1,2);
plot(t3,y3(:,2),"b")
hold on
plot(t4,y4(:,2),"r")
legend("Linearizada", "Não Linearizada")
xlabel("tempo [s]")
ylabel("\theta_2 [rad]")
title("\theta_2 utilizando o Método dos Trapézios na condição C1")
%Erro
figure(4)
subplot(2,1,1);
plot(t1,abs(y3(:,1)-y4(:,1)),"r")
xlabel("tempo [s]")
ylabel("|\theta_1_{lin} - \theta_1_{Ñlin}| [rad]")
title("Diferença de \theta_1 entre modelo linearizado e não linearizado (C1)")

subplot(2,1,2);
plot(t1,abs(y3(:,2)-y4(:,2)),"r")
xlabel("tempo [s]")
ylabel("|\theta_2_{lin} - \theta_2_{Ñlin}| [rad]")
title("Diferença de \theta_2 entre modelo linearizado e não linearizado para Método dos Trapézios (C1)")



%Equações linearizada para ode45 e ode23
figure(5)
subplot(2,1,1);
plot(t1,y1(:,1),"b")
hold on
plot(t3,y3(:,1),"r")
legend("Método de Runge-Kutta", "Método dos Trapézios")
xlabel("tempo [s]")
ylabel("\theta_1 [rad]")
title("\theta_1 linearizado com diferentes métodos de integração na condição C1")
subplot(2,1,2);
plot(t1,y1(:,2),"b")
hold on
plot(t3,y3(:,2),"r")
legend("Método de Runge-Kutta", "Método dos Trapézios")
xlabel("tempo [s]")
ylabel("\theta_2 [rad]")
title("\theta_2 linearizado com diferentes métodos de integração na condição C1")

%Erro
figure(6)
subplot(2,1,1);
plot(t1,abs(y1(:,1)-y3(:,1)),"r")
xlabel("tempo [s]")
ylabel("|\theta_1_{RK} - \theta_1_{T}| [rad]")
title("Diferença de \theta_1 linearizado entre Método de Range-Kutta e dos Trapézios (C1)")

subplot(2,1,2);
plot(t1,abs(y1(:,2)-y3(:,2)),"r")
xlabel("tempo [s]")
ylabel("|\theta_2_{RK} - \theta_2_{T}| [rad]")
title("Diferença de \theta_2 linearizado entre Método de Range-Kutta e dos Trapézios (C1)")

%Equações não linearizada para ode45 e ode23
figure(7)
subplot(2,1,1);
plot(t2,y2(:,1),"b")
hold on
plot(t4,y4(:,1),"r")
legend("Método de Runge-Kutta", "Método dos Trapézios")
xlabel("tempo [s]")
ylabel("\theta_1 [rad]")
title("\theta_1 não linearizado com diferentes métodos de integração na condição C1")
subplot(2,1,2);
plot(t2,y2(:,2),"b")
hold on
plot(t4,y4(:,2),"r")
legend("Método de Runge-Kutta", "Método dos Trapézios")
xlabel("tempo [s]")
ylabel("\theta_2 [rad]")
title("\theta_2 não linearizado com diferentes métodos de integração na condição C1")

%Erro
figure(8)
subplot(2,1,1);
plot(t1,abs(y2(:,1)-y4(:,1)),"r")
xlabel("tempo [s]")
ylabel("|\theta_1_{RK} - \theta_1_{T}| [rad]")
title("Diferença de \theta_1 não linearizado entre Método de Range-Kutta e dos Trapézios (C1)")

subplot(2,1,2);
plot(t1,abs(y2(:,2)-y4(:,2)),"r")
xlabel("tempo [s]")
ylabel("|\theta_2_{RK} - \theta_2_{T}| [rad]")
title("Diferença de \theta_2 não linearizado entre Método de Range-Kutta e dos Trapézios (C1)")

%Item h)-------------------------------------------------------------------
%Condição inicial C2

%C2
y_02 = [3 0 0 0];
%Não linearizada
ops = odeset('MaxStep', 1e-5);
[t5,y5] = ode45(@f2,tspan, y_02, ops); %N linearizado ode45
[t6,y6] = ode23t(@f2, tspan, y_02,ops); %N linearizado ode23t

%Cálculo da energia mecânica
g = 9.8;
l1 = g;
l2 = 5*l1/9;
mu = 2;
m1 = l1*mu;
m2 = l2*mu;
%Não linearizado ode45
T5 = (l1^2*(m1+3*m2).*y5(:,3).^2+3*cos(y5(:,1)-y5(:,2))*l1*l2*m2.*y5(:,3).*y5(:,4)+l2^2*m2.*y5(:,4).^2)/6;
V5 = -0.5*g.*(cos(y5(:,2))*l2*m2+cos(y5(:,1)).*l1*(m1+2*m2));
E5 = T5 + V5;

%Não linearizado ode23t
T6 = (l1^2*(m1+3*m2).*y6(:,3).^2+3*cos(y6(:,1)-y6(:,2))*l1*l2*m2.*y6(:,3).*y6(:,4)+l2^2*m2.*y6(:,4).^2)/6;
V6 = -0.5*g.*(cos(y6(:,2))*l2*m2+cos(y6(:,1)).*l1*(m1+2*m2));
E6 = T6 + V6;

%Equações não linearizada para ode45 e ode23 no caso C2
figure(9)
plot(t5,E5,"b")
hold on
plot(t6,E6,"r")
legend("Método de Runge-Kutta", "Método dos Trapézios")
xlabel("tempo [s]")
ylabel("Energia Mecânica [J]")
title("Energia mecânica no modelo não linearizado na condição C2")

%%Espaço de estados---------------------------------------------------------

%Espaço de estados linearizado
function dy1 = f1(t,y)
    w_p = 1;
    lamb = 9/5;
    dy1_1 = y(3);
    dy1_2 = y(4);
    dy1_3 = (3*(w_p)^2*(-1*(4+ 2*lamb)*y(1) + 3*y(2)))/(3 + 4*lamb);
    dy1_4 = (3*lamb*(w_p)^2*((6 + 3*lamb)*y(1) - 2*(3 + 1*lamb)*y(2)))/(3 + 4*lamb);
    dy1 = [dy1_1;dy1_2;dy1_3;dy1_4];
end

%Espaço de estados não linearizado
function dy2 = f2(t,y)
    w_p = 1;
    lamb = 9/5;
    dy2_1 = y(3);
    dy2_2 = y(4);
    dy2_3 = (-3*((5 + 4*lamb)*sin(y(1)) + 3*sin(y(1) - 2*y(2)))*(w_p*w_p))/(15 + 8*lamb - 9*cos(2*(y(1) - y(2)))) + (9*sin(2*(y(1) - y(2)))*(y(3)*y(3)))/(-15 - 8*lamb + 9*cos(2*(y(1) - y(2)))) - (6*sin(y(1) - y(2))*(y(4)*y(4)))/(lamb*(4*(3 + lamb) - 9*(cos(y(1) - y(2))*cos(y(1) - y(2)))));
    dy2_4 = (-3*lamb*(-3*(2 + lamb)*sin(2*y(1) - y(2)) + (6 + lamb)*sin(y(2)))*(w_p*w_p))/(15 + 8*lamb - 9*cos(2*(y(1) - y(2)))) + (6*lamb*(3 + lamb)*sin(y(1) - y(2))*(y(3)*y(3)))/(4*(3 + lamb) - 9*(cos(y(1) - y(2))*cos(y(1) - y(2)))) + (9*sin(2*(y(1) - y(2)))*(y(4)*y(4)))/(15 + 8*lamb - 9*cos(2*(y(1) - y(2))));
    dy2 = [dy2_1;dy2_2;dy2_3;dy2_4];
end

