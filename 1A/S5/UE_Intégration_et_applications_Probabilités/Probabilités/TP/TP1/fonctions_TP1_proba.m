    
% TP1 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom :
% Prénom : 
% Groupe : 1SN-

function varargout = fonctions_TP1_proba(varargin)

    switch varargin{1}     
        case 'ecriture_RVB'
            varargout{1} = feval(varargin{1},varargin{2:end});
        case {'vectorisation_par_colonne','decorrelation_colonnes'}
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
        case 'calcul_parametres_correlation'
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end}); 
    end

end

% Fonction ecriture_RVB (exercice_0.m) ------------------------------------
% (Copiez le corps de la fonction ecriture_RVB du fichier du meme nom)
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
image_RVB=M;
end

% Fonction vectorisation_par_colonne (exercice_1.m) -----------------------
function [Vd,Vg] = vectorisation_par_colonne(I)
I_gauche=I(:,1:end-1);
I_droite=I(:,2:end);
Vg=I_gauche(:);
Vd=I_droite(:);
end

% Fonction calcul_parametres_correlation (exercice_1.m) -------------------
function [r,a,b] = calcul_parametres_correlation(Vd,Vg)
Moy_Vd = mean(Vd);
Moy_Vg = mean(Vg);
Vdcarre = Vd.^2;
Vgcarre = Vg.^2;
VarVd = mean(Vdcarre)-(Moy_Vd^2);
VarVg = mean(Vgcarre)-(Moy_Vg^2);
Ectype_Vd = sqrt(VarVd);
Ectype_Vg = sqrt(VarVg);
Cov_VdVg = mean(Vd.*Vg) - Moy_Vd*Moy_Vg;
r = Cov_VdVg / (Ectype_Vd*Ectype_Vg);
a = Cov_VdVg / VarVg;
b = -a*Moy_Vd + Moy_Vg;



end

% Fonction decorrelation_colonnes (exercice_2.m) --------------------------
function [I_decorrelee,I_min] = decorrelation_colonnes(I,I_max)
IVg = I(:,1:end-1);
IVd = I(:,2:end);
I_decorrelee= IVd - IVg;
I_min= -I_max;
end



