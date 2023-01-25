
% TP2 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : XU
% Prénom : Thierry
% Groupe : 1SN-I

function varargout = fonctions_TP2_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction centrage_des_donnees (exercice_1.m) ----------------------------
function [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = ...
                centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees)
     x_G = mean(x_donnees_bruitees,2);
     y_G = mean(y_donnees_bruitees,2);
     x_donnees_bruitees_centrees = x_donnees_bruitees - x_G;
     y_donnees_bruitees_centrees = y_donnees_bruitees - y_G;
   
     
end

% Fonction estimation_Dyx_MV (exercice_1.m) -------------------------------
function [a_Dyx,b_Dyx] = ...
           estimation_Dyx_MV(x_donnees_bruitees,y_donnees_bruitees,n_tests)
    [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = ...
                centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);
    psi = (rand(n_tests,1) - 0.5)*pi;    
    y_rep = repmat(y_donnees_bruitees_centrees,100,1);
    [~,indice] = min(sum((y_rep - tan(psi).*x_donnees_bruitees_centrees).^2,2));
    a_Dyx = tan(psi(indice));
    b_Dyx = y_G - a_Dyx*x_G;
end

% Fonction estimation_Dyx_MC (exercice_2.m) -------------------------------
function [a_Dyx,b_Dyx] = ...
                   estimation_Dyx_MC(x_donnees_bruitees,y_donnees_bruitees)
    A = transpose([x_donnees_bruitees; ones(1,length(x_donnees_bruitees))]);
    B = transpose(y_donnees_bruitees);
    X = A\B;
    a_Dyx = X(1);
    b_Dyx = X(2);
    
end

% Fonction estimation_Dorth_MV (exercice_3.m) -----------------------------
function [theta_Dorth,rho_Dorth] = ...
         estimation_Dorth_MV(x_donnees_bruitees,y_donnees_bruitees,n_tests)

    [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = ...
                centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees)

    theta = (rand(n_tests,1) - 0.5)*pi;
    [~,indice] = min(sum((cos(theta)*x_donnees_bruitees_centrees+sin(theta)*y_donnees_bruitees_centrees).^2,2));
    theta_Dorth = theta(indice);
    rho_Dorth = x_G*cos(theta_Dorth)+y_G*cos(theta_Dorth);
end

% Fonction estimation_Dorth_MC (exercice_4.m) -----------------------------
function [theta_Dorth,rho_Dorth] = ...
                 estimation_Dorth_MC(x_donnees_bruitees,y_donnees_bruitees)

    [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = ...
                centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees)

    C = [x_donnees_bruitees_centrees' y_donnees_bruitees_centrees'];
    [vect_propres, val_propres]=eig(C'*C);
    [~,indice] = min(diag(val_propres));
    Y = vect_propres(:,indice);
    theta_Dorth = atan(Y(2)/Y(1));
    rho_Dorth = x_G*cos(theta_Dorth) + y_G*sin(theta_Dorth);


end
