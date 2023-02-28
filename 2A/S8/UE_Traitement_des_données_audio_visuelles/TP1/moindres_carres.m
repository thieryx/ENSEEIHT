function inconnu = moindres_carres(d, x, mat)
        [rows,~] = size(mat);
        A = zeros(rows,d);
        for i = 1:d
            A(:,i) = nchoosek(d,i)*(x.^i).*((1-x).^(d-i));
        end
        B = mat - mat(1)*((1-x).^d);

        inconnu = A\B;

end

