function X = moindres_carres_ponderes(D_app,probas)

    % Initialisation
    [~,n] = size(D_app);
    O = [zeros(n,1); 1];
    x = D_app(1,:)';
    y = D_app(2,:)';

    % Détermination de la solution
    A = [x.^2 x.*y y.^2 x y ones(n,1)];
    X = [A.*probas'; 1 0 1 0 0 0]\O;
end

