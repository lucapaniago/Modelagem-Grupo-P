tspan = 0:0.01:10;
y_0 = [10 0 0 0];
[t1,y1] = ode23t(@f, tspan, y_0);
[t2,y2] = ode45(@f, tspan, y_0);

figure
plot(t1,y1(:,1),"b")
hold on
plot(t2,y2(:,1),"r")

function dy = f(t,y)
    w_p = 1;
    lambda = 9/5;
    dy_1 = y(3);
    dy_2 = y(4);
    dy_3 = (3*w_p^2*(lambda*(2*lambda+3)*y(2)-2*(2*lambda+1)*y(1)))/(3*lambda+4);
    dy_4 = (3*w_p^2*((4*lambda*(lambda+2)+3)*y(1)-2*(lambda+1)^3*y(2)))/(lambda*(3*lambda+4));
    dy = [dy_1;dy_2;dy_3;dy_4];
end
