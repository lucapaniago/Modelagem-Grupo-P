%Item g)-------------------------------------------------------------------
%Condição inicial C1

tspan = 0:0.01:10;
%C1
y_01 = [0.1 0 0 0];
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
plot(t1,y1(:,1),"b")
hold on
plot(t2,y2(:,1),"r")
legend("Linearizada", "Não Linearizada")
xlabel("tempo [s]")
ylabel("\theta_1 [rad]")
title("\theta_1 utilizando o Método de Runge-Kutta na condição C1")

%Equações linearizada e não linearizada para ode23t
figure(2)
plot(t3,y3(:,1),"b")
hold on
plot(t4,y4(:,1),"r")
legend("Linearizada", "Não Linearizada")
xlabel("tempo [s]")
ylabel("\theta_1 [rad]")
title("\theta_1 utilizando o Método dos Trapézios na condição C1")

%Equações linearizada para ode45 e ode23
figure(3)
plot(t1,y1(:,1),"b")
hold on
plot(t3,y3(:,1),"r")
legend("Método de Runge-Kutta", "Método dos Trapézios")
xlabel("tempo [s]")
ylabel("\theta_1 [rad]")
title("\theta_1 linearizado com diferentes métodos de integração na condição C1")

%Equações não linearizada para ode45 e ode23
figure(4)
plot(t2,y2(:,1),"b")
hold on
plot(t4,y4(:,1),"r")
legend("Método de Runge-Kutta", "Método dos Trapézios")
xlabel("tempo [s]")
ylabel("\theta_1 [rad]")
title("\theta_1 não linearizado com diferentes métodos de integração na condição C1")

%Item h)-------------------------------------------------------------------
%Condição inicial C2

%C2
y_02 = [3 0 0 0];
%Não linearizada
[t5,y5] = ode45(@f2, tspan, y_02); %N linearizado ode45
[t6,y6] = ode23t(@f2, tspan, y_02); %N linearizado ode23t

%Cálculo da energia mecânica
g = 9.8;
l1 = g;
l2 = 5*l1/9;
%Não linearizado ode45
T5 = [];
V5 = [];
for i = (1:length(y5(:,1)))
    T = (l1^2*(l1+3*l2)*y5(i,3)^2+3*cos(y5(i,1)-y5(i,2))*l1*l2*l2*y5(i,3)*y5(i,4)+l2^2*l2*y5(i,4)^2)/6;
    T5(i) = T;
    V = (-g*(cos(y5(i,2))*l2*l2+cos(y5(i,1))*l1*(l1+2*l2)))/2;
    V5(i) = V;
end
E5 = T5 + V5;
%Não linearizado ode23t
T6 = [];
V6 = [];
for i = (1:length(y6(:,1)))
    T = (l1^2*(l1+3*l2)*y6(i,3)^2+3*cos(y6(i,1)-y6(i,2))*l1*l2*l2*y6(i,3)*y6(i,4)+l2^2*l2*y6(i,4)^2)/6;
    T6(i) = T;
    V = (-g*(cos(y6(i,2))*l2*l2+cos(y6(i,1))*l1*(l1+2*l2)))/2;
    V6(i) = V;
end
E6 = T6 + V6;

%Equações não linearizada para ode45 e ode23 no caso C2
figure(5)
plot(t5,E5,"b")
hold on
plot(t6,E6,"r")
legend("Método de Runge-Kutta", "Método dos Trapézios")
xlabel("tempo [s]")
ylabel("Energia Mecânica por densidade linear(\mu) [J*m/kg]")
title("Energia mecânica no modelo não linearizado na condição C2")

%Espaço de estados---------------------------------------------------------

%Espaço de estados linearizado
function dy1 = f1(t,y)
    w_p = 1;
    lamb = 9/5;
    dy1_1 = y(3);
    dy1_2 = y(4);
    dy1_3 = (-3*(w_p)*w_p)*((2 + 4*lamb)*y(1) - 3*lamb*y(2))/(4 + 3*lamb);
    dy1_4 = (3*lamb*(w_p)*w_p)*((3 + 6*lamb)*y(1) - 2*(1 + 3*lamb)*y(2))/(4 + 3*lamb);
    dy1 = [dy1_1;dy1_2;dy1_3;dy1_4];
end

%Espaço de estados não linearizado
function dy2 = f2(t,y)
    w_p = 1;
    lamb = 9/5;
    dy2_1 = y(3);
    dy2_2 = y(4);
    dy2_3 = (3*((4 + 5*lamb)*sin(y(1)) + 3*lamb*sin(y(1) - 2*y(2)))*w_p*w_p)/(-8 - 15*lamb + 9*lamb*cos(2*(y(1) - y(2)))) + (9*lamb*sin(2*(y(1) - y(2)))*(y(3)*y(3)))/(-8 - 15*lamb + 9*lamb*cos(2*(y(1) - y(2)))) + (6*sin(y(1) - y(2))*(y(4)*y(4)))/(-4 - 12*lamb + 9*lamb*(cos(y(1) - y(2))*cos(y(1) - y(2))));
    dy2_4 = (3*lamb*(-3*(1 + 2*lamb)*sin(2*y(1) - y(2)) + (1 + 6*lamb)*sin(y(2)))*w_p*w_p)/(-8 - 15*lamb + 9*lamb*cos(2*(y(1) - y(2)))) - (6*lamb*(1 + 3*lamb)*sin(y(1) - y(2))*(y(3)*y(3)))/(-4 - 12*lamb + 9*lamb*(cos(y(1) - y(2))*cos(y(1) - y(2)))) + (9*lamb*sin(2*(y(1) - y(2)))*(y(4)*y(4)))/(8 + 15*lamb - 9*lamb*cos(2*(y(1) - y(2))));
    dy2 = [dy2_1;dy2_2;dy2_3;dy2_4];
end

