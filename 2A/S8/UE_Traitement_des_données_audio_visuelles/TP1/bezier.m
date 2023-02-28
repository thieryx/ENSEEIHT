function y = bezier(x,var_0,var)
    p = length(x);
    [r,~] = size(var);
    B = zeros(p,r);
    for i = 1:r
        B(:,i) = nchoosek(r,i)*(x.^i).*((1-x).^(r-i));
    end
    
    y = var_0*(x.^0).*((1-x).^r) + B*var;

end

