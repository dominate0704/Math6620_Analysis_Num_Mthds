function y_m = error_ply(x,c, t)
    y_m = 0;
    len = length(t);
    for i = 1:len
        y = abs(intpval(x,c,t(i))-functionf(t(i)));
        if y_m < y
            y_m = y;
        end
    end
    
    
end