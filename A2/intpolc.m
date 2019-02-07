function f = intpolc(x,f)
m = length(x);
for k = 2:m
 f(k:m) = (f(k:m) - f(k-1:m-1)) ./ (x(k:m) - x(1:m+1-k));
end