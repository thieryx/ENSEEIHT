function X = moindres_carres_ponderes(D_app,probas)

    size(probas)
    % Initialisation
    [~,n] = size(D_app);
    O = [zeros(n,1)];
    x = D_app(1,:)';
    y = D_app(2,:)';

    % Détermination de la solution
    A = [x.^2 x.*y y.^2 x y ones(length(x),1)];
    [~,n_cols_A] = size(A)
    rep_probas = repmat(probas,n_cols_A,1);
    size(rep_probas)
    X = (A*rep_probas)\O;
    size(A)
    size(X);
end

