function inconnu = moindres_carres(d, x, mat)
        A = arrayfun(@(n) nchoosek(d,n), (1:d));
        A = A.*x.^(1:d).*(1-x).^(d-(1:d));
        B = mat - mat(1)*((1-x).^d);
        inconnu = A\B;
end

