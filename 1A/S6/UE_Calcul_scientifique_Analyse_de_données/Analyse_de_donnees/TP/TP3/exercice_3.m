%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de données
% TP3 - Classification bayésienne
% exercice_3.m
%--------------------------------------------------------------------------

clear
close all
clc

% Chargement des données de l'exercice 2
load resultats_ex2

%% Classifieur par maximum de vraisemblance
% code_classe est la matrice contenant des 1 pour les chrysanthemes
%                                          2 pour les oeillets
%                                          3 pour les pensees
% l'att ribution de 1,2 ou 3 correspond au maximum des trois vraisemblances
classe_oeillets = (V_oeillets>=V_chrysanthemes) & (V_oeillets>=V_pensees);
classe_chrysanthemes = (V_chrysanthemes>V_pensees) & (V_chrysanthemes>=V_oeillets);
classe_pensees = (V_pensees>V_chrysanthemes) & (V_pensees>V_oeillets);
code_classe = 3*classe_pensees + 2*classe_chrysanthemes + classe_oeillets;






%% Affichage des classes

figure('Name','Classification par maximum de vraisemblance',...
       'Position',[0.25*L,0.1*H,0.5*L,0.8*H])
axis equal ij
axis([r(1) r(end) v(1) v(end)]);
hold on
imagesc(r,v,code_classe)
carte_couleurs = [.45 .45 .65 ; .45 .65 .45 ; .65 .45 .45];
colormap(carte_couleurs)
hx = xlabel('$\overline{r}$','FontSize',20);
set(hx,'Interpreter','Latex')
hy = ylabel('$\bar{v}$','FontSize',20);
set(hy,'Interpreter','Latex')
view(-90,90)

%% Comptage des images correctement classees

% X_pensees == les coordonnées des pensées sur la grille (R,V)
X = X_pensees;
% Comptage des images de pensées correctement classees

V_classe_pensees = vraisemblance(X(:,1), X(:,2), mu_pensees, Sigma_pensees, denominateur_classe_pensees);
V_classe_oeillets = vraisemblance(X(:,1), X(:,2), mu_oeillets, Sigma_oeillets, denominateur_classe_oeillets);
V_classe_chrysanthemes = vraisemblance(X(:,1), X(:,2), mu_chrysanthemes, Sigma_chrysanthemes, denominateur_classe_chrysanthemes);

%-----------
bien_classees = (V_classe_pensees > V_classe_chrysanthemes) & (V_classe_pensees > V_classe_oeillets);
%-----------

cpt_images_correctement_classees = sum(bien_classees);
i_bc = find(bien_classees == 1);
i_pbc = find(bien_classees == 0);

plot(X(i_pbc,1), X(i_pbc,2), 'ko');
plot(X(i_bc,1), X(i_bc,2), 'ro');
