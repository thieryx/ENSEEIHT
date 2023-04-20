function f = retroprojection(sinogramme,theta,nb_rayons,nb_lignes,nb_colonnes)
    f = zeros(nb_lignes,nb_colonnes);
    for i=1:nb_lignes
        for j=1:nb_colonnes
            for k=1:length(theta)
                angle = theta(k)*pi/180;
                x = j - round(nb_colonnes/2);
                y = round(nb_lignes/2) - i;
                t = round(x*cos(angle)+y*sin(angle) + nb_rayons/2);
                f(i,j) = f(i,j) + sinogramme(t,k)*t;
            end
            f(i,j) = f(i,j)/nb_rayons;
        end
    end
end

