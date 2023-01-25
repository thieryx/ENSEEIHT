function image_RVB = ecriture_RVB(image_originale)
[nb_lignes,nb_colonnes]=size(image_originale);
V1=image_originale(1:2:end,1:2:end);
R=image_originale(1:2:end,2:2:end);
V2=image_originale(2:2:end,2:2:end);
B=image_originale(2:2:end,1:2:end);
V=(V1+V2)/2;
M=zeros(nb_lignes/2,nb_colonnes/2,3);
M(:,:,1)=R;
M(:,:,2)=V;
M(:,:,3)=B;
image_RVB=M

end