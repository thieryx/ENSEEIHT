function L = laplacian(nu,dx1,dx2,N1,N2)
%
%  Cette fonction construit la matrice de l'opérateur Laplacien 2D anisotrope
%
%  Inputs
%  ------
%
%  nu : nu=[nu1;nu2], coefficients de diffusivité dans les dierctions x1 et x2. 
%
%  dx1 : pas d'espace dans la direction x1.
%
%  dx2 : pas d'espace dans la direction x2.
%
%  N1 : nombre de points de grille dans la direction x1.
%
%  N2 : nombre de points de grilles dans la direction x2.
%
%  Outputs:
%  -------
%
%  L      : Matrice de l'opérateur Laplacien (dimension N1N2 x N1N2)
%
% 

% Initialisation
L=sparse([]);

a = 2*((nu(1)/dx1^2)+(nu(2)/dx2^2));
b2=nu(2)/dx2^2;
b1= nu(1)/dx1^2;
e=ones(N1*N2,1);
L=spdiags([-b1*e -b2*e a*e -b2*e -b1*e], [-N2;-1;0;1;N2], N1*N2, N1*N2);
full(L);
i=N2;
j=N2+1;
while (i<N1*N2)
    L(i,j)= 0;
    L(j,i)=0;
    i=i+N2;
    j=j+N2;
end

end    
