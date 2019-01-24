function [ x, ex ] = secant( f, x0, x1, nmax )
%
% Secant Method
%   Secant Method for finding successively better approximations to the 
%   zeroes of a real-valued function.
%
% Input:
%   f - input funtion
%   x0 - inicial aproximation
%   x1 - inicial aproximation
%   nmax - maximum number of iterations
%
% Output:
%   x - aproximation to root
%   ex - error estimate
%
% Example:
%	[ x, ex ] = secant( exp(x)+x, 0, 1,  10 )
%
%
    f0 = f(x0);
    f1 = f(x1);
    x(1) = x1;
    x(2) = (x0*f1 - x1*f0)/f1-f0;
    ex(1)= 0;
    ex(2) = abs(x(2)-x1);
    k = 3;
    while (k <= nmax)
        f0= f1;
        f1=f(x(k-1));
        if (f0 == f1)
            x(k)= x(k-1);
            ex(k) = 0;
        else
            x(k) = (x(k-2)*f1 - x(k-1)*f0)/(f1-f0);
            ex(k) = abs(x(k)-x(k-1));
        end
        k = k+1;
    end
end

