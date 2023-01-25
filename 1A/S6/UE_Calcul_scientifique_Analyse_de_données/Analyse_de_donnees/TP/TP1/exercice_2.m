clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Separation des canaux RVB','Position',[0,0,0.67*L,0.67*H]);
figure('Name','Nuage de pixels dans le repere RVB','Position',[0.67*L,0,0.33*L,0.45*H]);

% Lecture et affichage d'une image RVB :
I = imread('ishihara-0.png');
figure(1);				% Premiere fenetre d'affichage
subplot(2,2,1);				% La fenetre comporte 2 lignes et 2 colonnes
imagesc(I);
axis off;
axis equal;
title('Image RVB','FontSize',20);

% Decoupage de l'image en trois canaux et conversion en doubles :
R = double(I(:,:,1));
V = double(I(:,:,2));
B = double(I(:,:,3));

% Affichage du canal R :
colormap gray;				% Pour afficher les images en niveaux de gris
subplot(2,2,2);
imagesc(R);
axis off;
axis equal;
title('Canal R','FontSize',20);

% Affichage du canal V :
subplot(2,2,3);
imagesc(V);
axis off;
axis equal;
title('Canal V','FontSize',20);

% Affichage du canal B :
subplot(2,2,4);
imagesc(B);
axis off;
axis equal;
title('Composante 3','FontSize',20);

% Affichage du nuage de pixels dans le repere RVB :
figure(2);				% Deuxieme fenetre d'affichage
plot3(R,V,B,'b.');
axis equal;
xlabel('R');
ylabel('V');
zlabel('B');
rotate3d;

% Matrice des donnees :
X = [R(:) V(:) B(:)];			% Les trois canaux sont vectorises et concatenes

% Nombre d'individus
n = size(X,1);

% Individu moyen
x_moyen = (1/n)*X'*ones(n,1);

% Données centrées
X_c = X - x_moyen';

% Matrice de variance/covariance :
sigma = (1/n)*X'*X - x_moyen*x_moyen';

% Coefficients de correlation lineaire :
r_rv = sigma(1,2)/(sqrt(sigma(1,1))*sqrt(sigma(2,2)));
r_vb = sigma(2,3)/(sqrt(sigma(2,2))*sqrt(sigma(3,3)));
r_rb = sigma(3,1)/(sqrt(sigma(1,1))*sqrt(sigma(3,3)));

D = diag(diag(sigma));
X01 = X_c*inv(sqrt(D));
R01 = (1/n)*X01'*X01;

% Proportions de contraste :
c_r = sigma(1,1)/trace(sigma);
c_v = sigma(2,2)/trace(sigma);
c_b = sigma(3,3)/trace(sigma);

% Couples propres
[W, D] = eig(sigma);

[vp, indices] = sort(diag(D), 'descend');

W = W(:, indices);

C = X_c*W;

C1 = reshape(C(:,1), size(R));
C2 = reshape(C(:,2), size(R));
C3 = reshape(C(:,3), size(R));

figure('Name', 'Séparation suivant les composantes');


% Lecture et affichage d'une image RVB :
I = imread('ishihara-0.png');
figure(3);				% Premiere fenetre d'affichage
subplot(2,2,1);				% La fenetre comporte 2 lignes et 2 colonnes
imagesc(I);
axis off;
axis equal;
title('Image RVB','FontSize',20);

% Affichage de la première composante :
colormap gray;				
subplot(2,2,2);
imagesc(C1);
axis off;
axis equal;
title('Composante 1','FontSize',20);

% Affichage de composante 2:
subplot(2,2,3);
imagesc(C2);
axis off;
axis equal;
title('Composante 2','FontSize',20);

% Affichage de la composante 3 :
subplot(2,2,4);
imagesc(C3);
axis off;
axis equal;
title('Composante 3','FontSize',20);