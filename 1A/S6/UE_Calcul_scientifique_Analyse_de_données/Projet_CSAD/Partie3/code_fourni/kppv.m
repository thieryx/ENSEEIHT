%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de donnees
%
% Données :
% DataA      : les données d'apprentissage (connues)
% LabelA     : les labels des données d'apprentissage
%
% DataT      : les données de test (on veut trouver leur label)
% Nt_test    : nombre de données tests qu'on veut labelliser
%
% K          : le K de l'algorithme des k-plus-proches-voisins
% ListeClass : les classes possibles (== les labels possibles)
%
% Résultat :
% Partition : pour les Nt_test données de test, le label calculé
% d : distances entre le vecteur de test et les vecteurs d'apprentissage
% indicesppv : indices des K plus proches voisins
%--------------------------------------------------------------------------
function [Partition, Confusion] = kppv(DataA, LabelA, DataT, LabelT, ListeClass)

[Na,~] = size(DataA);

% Initialisation du vecteur d'étiquetage des images tests
Confusion = zeros(length(ListeClass));
disp(['Classification des images test dans ' num2str(length(ListeClass)) ' classes'])
disp(['par la methode des ' num2str(1) ' plus proches voisins:'])
    
% Calcul des distances entre le vecteur de test 
% et les vecteurs d'apprentissage (voisins)
d = sum((DataA-ones(Na,1)*DataT).^2,2);
    
[~,I] = sort(d, 'ascend') ;

% Trouver la classe
indice_min = I(1);
Partition = LabelA(indice_min);
class = Partition;
Confusion(6*(fix(LabelT/10)-1) + rem(LabelT,10), 6*(fix(class/10)-1) + rem(class,10)) = Confusion(6*(fix(LabelT/10)-1) + rem(LabelT,10), 6*(fix(class/10)-1) + rem(class,10)) +1 ;
    

end