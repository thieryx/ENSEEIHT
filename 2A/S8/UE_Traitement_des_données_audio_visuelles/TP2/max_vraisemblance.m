function parametres_MV = max_vraisemblance(D_app,parametres_test)
    
    % Initialisation
    [r,~] = size(parametres_test);
    [~,c] = size(D_app);
    mat_r = zeros(r,c);
    
    for i=1:r
    %mat_r = arrayfun(@(i) calcul_r(D_app,parametres_test(i,:)), (1:r));
        mat_r(i,:) = calcul_r(D_app,parametres_test(i,:));
    end

    [~,min_index] = min(sum(mat_r.^2,2));
    parametres_MV = parametres_test(min_index,:);
end

