function p = intpval(x,c,t)
m = length(x);
p = c(m) * ones(size(t));
for k = m-1:-1:1
 p = p.*(t-x(k)) + c(k);
end

