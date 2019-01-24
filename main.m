%%

A= [1,5,10, 25, 50];
k =1;
n = length(A);
iterate = 10;
x_newton = [];
error_newton = [];
x_secant = [];
error_secant =[];
C ={};
s1= "x+ exp(-";
s2 = "*x^2)*cos(x)";
iterate_time = ["1","2","3","4","5","6","7","8","9","10"];
while (k <= n)
    syms x
    f = x+ exp(-A(k)*x^2)*cos(x);
    f1 = diff(f);
    str= sprintf('%s%d%s',s1,A(k),s2);
    C{k}=str;
    str = sprintf('Function f(x) = %s, x0 = %d. Here is the iteration table:', str, 0);
    disp(str);
    [ x_n, error_n] = newton( inline(f), inline(f1), 0,  iterate );
    x_newton(k)= x_n(iterate);
    error_newton(k)= error_n(iterate);
    [ x_s, error_s ] = secant( inline(f), 0, 1,  iterate );
    x_secant(k)= x_s(iterate);
    error_secant(k)= error_s(iterate);
    k= k+1;
    G = table('RowNames',iterate_time');
    G.newton_x = x_n';
    G.error_newton = error_n';
    G.secant_x = x_s';
    G.error_secant = error_s';
    disp(G);
end
a = string(C);
b = cellstr(a');

T = table('RowNames',b);
T.newton_x = x_newton';
T.error_newton = error_newton';
T.secant_x = x_secant';
T.error_secant = error_secant';
disp(T);

x_0 = [-1, -0.5,-0.2,-0.1,0, 0.1, 0.2, 0.5, 1];
i=1;
T= {};
k =1;
while (k <= n)
    syms x
    f = x+ exp(-A(k)*x^2)*cos(x);
    f1 = diff(f);
    str= sprintf('%s%d%s',s1,A(k),s2);
    str = sprintf('Function f(x) = %s, Here is the result table after 10 time iterations based on different initial guess:', str);
    disp(str);
    i = 1;
    while(i<= length(x_0))
        [ x_n, error_n] = newton( inline(f), inline(f1), x_0(i),  iterate );
        x_newton(i)= x_n(iterate);
        error_newton(i)= error_n(iterate);
        [ x_s, error_s ] = secant( inline(f), x_0(i), 0.3,  iterate );
        x_secant(i)= x_s(iterate);
        error_secant(i)= error_s(iterate);
        i=i+1;
    end
    k= k+1;  
    T = table();
    T.x_0 = x_0';
    T.newton_x = x_newton';
    T.error_newton = error_newton';
    T.secant_x = x_secant';
    T.error_secant = error_secant';
    disp(T);
end



