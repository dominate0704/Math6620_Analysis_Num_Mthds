y_er = zeros(20,1);
x_er = zeros(20,1);
for n = 1:20
    h = 10/n;
    x = zeros(n+1,1);
    y = zeros(n+1,1);
    x(1) = -5;
    y(1) = 1/26;
    f = @functionf;
    for i = 1:n
        x(i+1) = -5+i*h;
        y(i+1) = f(x(i+1));
    end
    c = intpolc(x,y);
    t = -5:.01:5;
    p = intpval(x,c,t);
    y_er(n) = error_ply(x,c,t);
    title_s = strcat('Deg ', num2str(n));
    h = figure;
    plot(x,y,'o',t,p,'r-',t,f(t),'b-');
    saveas(h,title_s,'jpg');        
end
x_dg = 1:20;
G = table();
format long;
G.Degree = x_dg';
G.Error = y_er;
disp(G);
plot(x_dg,y_er,'o-');
title_s = "error";
saveas(h,title_s,'jpg'); 