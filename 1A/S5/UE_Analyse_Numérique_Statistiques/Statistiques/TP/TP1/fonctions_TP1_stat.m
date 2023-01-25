
% TP1 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : Xu
% Prénom : Thierry
% Groupe : 1SN-I

function varargout = fonctions_TP1_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction G_et_R_moyen (exercice_1.m) ----------------------------------
function [G, R_moyen, distances] = ...
         G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees)
    G = [mean(x_donnees_bruitees), mean(y_donnees_bruitees)];
    x_donnees_bruitees_new = (x_donnees_bruitees - G(1)).^2;
    y_donnees_bruitees_new = (y_donnees_bruitees - G(2)).^2;
    distances = sqrt(x_donnees_bruitees_new + y_donnees_bruitees_new);
    R_moyen = mean(distances);
     
end

% Fonction estimation_C_uniforme (exercice_1.m) ---------------------------
function [C_estime, R_moyen] = ...
         estimation_C_uniforme(x_donnees_bruitees,y_donnees_bruitees,n_tests)
    [G, R_moyen, ~] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);

    C_x_random = (rand(n_tests,1)*2*R_moyen) - R_moyen + G(1);
    C_y_random = (rand(n_tests,1)*2*R_moyen) - R_moyen + G(2);

    X_new = repmat(x_donnees_bruitees,n_tests,1);
    Y_new = repmat(y_donnees_bruitees,n_tests,1);

    C_x = repmat(C_x_random,1,length(x_donnees_bruitees));
    C_y = repmat(C_y_radom,1,length(x_donnees_bruitees));

    X = X_new - C_x;
    Y = Y_new - C_y;

    D = sqrt(X.^2 + Y.^2);
    [~,indice] = min(sum((D - R_moyen).^2));
    C_estime = [C_x_random(indice), C_y_radom(indice)];
     

end

% Fonction estimation_C_et_R_uniforme (exercice_2.m) ----------------------
function [C_estime, R_estime] = ...
         estimation_C_et_R_uniforme(x_donnees_bruitees,y_donnees_bruitees,n_tests)
    [G, R_moyen, ~] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);
    C_random = (rand(n_tests,2)*2*R_moyen) - R_moyen + G;
    R_random = (rand(n_tests,1)+0.5)*R_moyen;
    C_x = repmat(C_random(:,1),1,length(x_donnees_bruitees));
    C_y = repmat(C_random(:,2),1,length(x_donnees_bruitees));
    X_new = repmat(x_donnees_bruitees,n_tests,1);
    Y_new = repmat(y_donnees_bruitees,n_tests,1);
    D = sqrt((X_new - C_x).^2 + (Y_new - C_y).^2);
    [~,indice]=min(sum((D-R_random).^2,2));
    C_estime = C_random(indice,:);
    R_estime = R_random(indice);


end

% Fonction occultation_donnees (donnees_occultees.m) ----------------------
function [x_donnees_bruitees, y_donnees_bruitees] = ...
         occultation_donnees(x_donnees_bruitees, y_donnees_bruitees, theta_donnees_bruitees)
theta1 = 2*pi*rand(1);
theta2 = 2*pi*rand(1);

if (theta2 > theta1)
    x_donnees_bruitees = x_donnees_bruitees(theta_donnees_bruitees>theta1 & theta_donnees_bruitees<theta2);
    y_donnees_bruitees = y_donnees_bruitees(theta_donnees_bruitees>theta1 & theta_donnees_bruitees<theta2);
else
    x_donnees_bruitees = x_donnees_bruitees(theta_donnees_bruitees>theta1 | theta_donnees_bruitees<theta2);
    y_donnees_bruitees = y_donnees_bruitees(theta_donnees_bruitees>theta1 | theta_donnees_bruitees<theta2);
end

end

% Fonction estimation_C_et_R_normale (exercice_4.m, bonus) ----------------
function [C_estime, R_estime] = ...
         estimation_C_et_R_normale(x_donnees_bruitees,y_donnees_bruitees,n_tests)



end
