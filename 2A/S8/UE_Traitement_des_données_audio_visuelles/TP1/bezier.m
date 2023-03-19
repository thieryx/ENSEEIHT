function y = bezier(x,var_0,var)
    [d,~] = size(var);
    B = arrayfun(@(n) nchoosek(d,n), (1:d));
    B = B.*x.^(1:d).*(1-x).^(d-(1:d));
    y = var_0*(x.^0).*((1-x).^d) + B*var;
end

