function X = moindres_carres(D_app)

    % Initialisation
    [~,n] = size(D_app);
    O = [zeros(n,1) ; 1];
    x = D_app(1,:)';
    y = D_app(2,:)';

    % Détermination de la solution
    A = [x.^2 x.*y y.^2 x y ones(n,1) ; 1 0 1 0 0 0];
    X = A\O;
end

