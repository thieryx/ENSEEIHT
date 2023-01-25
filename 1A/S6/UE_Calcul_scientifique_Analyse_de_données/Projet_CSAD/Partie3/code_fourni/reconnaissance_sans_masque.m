clear;
close all;

load eigenfaces_part3;

% Tirage aléatoire d'une image de test :
%personne = randi(nb_personnes)
%posture = randi(nb_postures)
% si on veut tester/mettre au point, on fixe l'individu
%personne = 10
%posture = 6

ficF = strcat('./Data/', liste_personnes{personne}, liste_postures{posture}, '-300x400.gif')
img = imread(ficF);
image_test = double(transpose(img(:)));
 
% Nombre q de composantes principales à prendre en compte 
q = 2;

% dans un second temps, q peut être calculé afin d'atteindre le pourcentage
% d'information avec q valeurs propres (contraste)
% Pourcentage d'information 
per = 0.75;

%Calcul 
n_c = size(Sigma2,1);
% Calcul des vecteurs/valeurs propres de la matrice Sigma2 :
[ D, V, n_ev, ~, ~, ~ ] = subspace_iter_v3( Sigma2, m, per, p, eps, maxit );
% Les vecteurs propres de Sigma (les eigenfaces) se deduisent de ceux de Sigma2 :
proj_X_centre =[];
for i = 1:n_ev
    proj_X_centre = [proj_X_centre X_centre'*V(:,i) ];
end 
% Tri par ordre decroissant des valeurs propres de Sigma2 :
[Valeur_propres_triees, indices ] = sort(D,"descend");
% Tri des eigenfaces dans le meme ordre 
% (on enleve la derniere eigenface, qui appartient au noyau de Sigma) :
V_triee = proj_X_centre(:,indices);
% Normalisation des eigenfaces :
for i = 1:n_ev
    V_triee(:,i) = V_triee(:,i)/norm(V_triee(:,i));
end
% Composantes principales des images d'apprentissages
DataA= X_centre*V_triee(:,1:q);
% Composantes principales de l'image test
DataT = (image_test-individu_moyen)*V_triee(:,1:q);
% Choix du nombre de voisins
K = 1;

LabelA = [];
for i = 1:32
    for j = 1:6 
        LabelA = [LabelA (i*10+j)];
    end
end
LabelT = [personne*10 + posture];
DataT = (image_test-individu_moyen)*V_triee(:,1:q);
ListeClass = LabelA;
Nt_test = 1;

%Appel du classifieur kppv sur les q composantes principales
%[~, distance, indice] = kppv(DataA(:,1:q), DataT(:,1:q), K);
%[Partition, d, indicesppv] = kppv(DataA(:,1:q), LabelA, DataT(:,1:q), Nt_test, K, ListeClass);
[Partition, Confusion] = kppv(DataA, LabelA, DataT, LabelT, ListeClass);

% individu pseudo-résultat pour l'affichage (A CHANGER)
personne_proche = fix(Partition/10);
posture_proche = rem(Partition,10);
A = 2;
figure('Name','Image tiree aleatoirement','Position',[0.2*L,0.2*H,0.8*L,0.5*H]);

subplot(1, 2, 1);
% Affichage de l'image de test :
colormap gray;
imagesc(img);
title({['Individu de test : posture ' num2str(posture) ' de ', liste_personnes{personne}]}, 'FontSize', 20);
axis image;

ficF = strcat('./Data/', liste_personnes_base{personne_proche}, liste_postures{posture_proche}, '-300x400.gif');
img = imread(ficF);
        
subplot(1, 2, 2);
imagesc(img);
title({['Individu le plus proche : posture ' num2str(posture_proche) ' de ', liste_personnes_base{personne_proche}]}, 'FontSize', 20);
axis image;
