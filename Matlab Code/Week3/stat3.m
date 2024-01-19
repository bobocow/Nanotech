function [m,s] = stat3(x)

    arguments
        x
    end
    n = length(x);
    m = avg(x,n);
    s = sqrt(sum((x-m).^2/n));
    
end

function m = avg(x,n)
    m = sum(x)/n;
end