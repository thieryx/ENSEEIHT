clear all;
close all;
% Data et DataMod pour estimation 
%ImMod mage modifiée

% I image originale
load SG7;
% ImMod image original
load ImSG7;

[n,m] = size(ImMod);
[n1,m1] = size(DataMod);

figure;
subplot(1,2,1);
hold on;
title('Partie image originale');
imshow(Data);
axis equal;

subplot(1,2,2);
hold on;
title('Partie image modifiée');
imshow(DataMod);
axis equal;

%Equation
A = [-Data(:) ones(n1*m1,1)];
B = log(DataMod(:));

% Solution
X = A\B;
alpha = X(1);
beta = X(2);
Image = (log(ImMod) - beta)*(-1/alpha);

figure;
subplot(2,2,1);
hold on;
title('Image modifiée');
imshow(ImMod);

subplot(2,2,2);
hold on;
title('Image reconstruire');
imshow(Image);

subplot(2,2,3);
hold on;
title('Image originale');
imshow(I);
