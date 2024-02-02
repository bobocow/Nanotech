function [f,g,h] = f1(x,c)
if (nargin == 1), c = 1; end
f = 1-x.*exp(-x.^2/c);
if (nargout > 1), g = -exp(-x.^2) + 2*(x.^2).*exp(-x.^2);
end
if (nargout > 2), h = 6*x.*exp(-x.*x) - 4*x.^3.*exp(-x.*x);
end