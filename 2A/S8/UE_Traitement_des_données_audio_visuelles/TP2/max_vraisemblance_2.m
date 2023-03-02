function parametres_estim = max_vraisemblance_2(D_app,parametres_test,sigma)
    pi = 0.5;
    [r,~] = size(parametres_test);
    [~,c] = size(D_app);
    mat_r1 = zeros(r,c);
    mat_r2 = zeros(r,c);

    for i=1:r
    %mat_r = arrayfun(@(i) calcul_r(D_app,parametres_test(i,:)), (1:r));
        mat_r1(i,:) = calcul_r(D_app,parametres_test(i,1,:));
        mat_r2(i,:) = calcul_r(D_app,parametres_test(i,2,:));
    end
    mat_r1_carre = mat_r1.^2;
    mat_r2_carre = mat_r2.^2;

    [~,max_index] = max(sum(log2((pi/sigma)*exp(-(mat_r1_carre/(2*sigma^1)))+(pi/sigma)*exp(-(mat_r2_carre/(2*sigma^1)))),2));
    parametres_estim = parametres_test(max_index,:);
    
end

