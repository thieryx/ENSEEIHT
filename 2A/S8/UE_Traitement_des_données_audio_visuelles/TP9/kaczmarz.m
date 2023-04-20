function f = kaczmarz(p,W,n_boucles)
    [n_mesures,nb_pixels] = size(W);
    f = zeros(nb_pixels,1);
    W_norm = sum(W.^2,2);
    Wt = W';
    for k=1:n_boucles
        for i=1:n_mesures
            if W_norm(i)~=0
                f = f + ((p(i)-Wt(:,i)'*f)/W_norm(i))*Wt(:,i);
            end
        end
    end
end

