function probas = probabilites(D_app,parametres_estim,sigma)
    
    % Initialisation
    pi = 0.5;

    %mat_r = arrayfun(@(i) calcul_r(D_app,parametres_test(i,:)), (1:r));
    % Détermination des valeurs de l'objectif (9)
    mat_r1 = calcul_r(D_app,parametres_estim(1,:));
    mat_r2 = calcul_r(D_app,parametres_estim(2,:));
    mat_r1_carre = mat_r1.^2;
    mat_r2_carre = mat_r2.^2;
    probas = [(pi / (sigma*sqrt(2*pi) ) * exp(-mat_r1_carre/(2*sigma^2))); 
            (pi / (sigma*sqrt(2*pi) ) * exp(-mat_r2_carre/(2*sigma^2))) ];
end

