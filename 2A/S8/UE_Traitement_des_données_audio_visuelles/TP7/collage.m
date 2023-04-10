function u = collage(r,s,interieur)
    
    u = r;

    [rows,cols,~] = size(r);
    nb_pixels = rows*cols;

    r_double = double(r);
    s_double = double(s);

    % Operateur gradient:
    e = ones(nb_pixels,1);
    Dx = spdiags([-e e],[0 rows],nb_pixels,nb_pixels);
    Dx(end-rows+1:end,:) = 0;
    Dy = spdiags([-e e],[0 1],nb_pixels,nb_pixels);
    Dy(rows:rows:end,:) = 0;

    for k = 1:size(r,3)
        
        reshaped_r = reshape(r_double(:,:,k), [nb_pixels,1]);
        reshaped_s = reshape(s_double(:,:,k), [nb_pixels,1]);

        r_grad_x = Dx*reshaped_r;
        r_grad_y = Dy*reshaped_r;
        s_grad_x = Dx*reshaped_s;
        s_grad_y = Dy*reshaped_s;


        g_x = s_grad_x;
        size(s_grad_x)
        size(interieur)
        size(r_grad_x)
        g_x(interieur) = r_grad_x(interieur);
        g_y = s_grad_y;
        g_y(interieur) = r_grad_y(interieur);
    
        div_g = Dy*g_y + Dx*g_x;
    
        A = -Dx'*Dx - Dy'*Dy;
        
        % Condition aux bords
        bord_r = zeros(size(r_double(:,:,k)));
        bord_r(2:end-1,2:end-1) = 1;
        indices_bord_r = find(bord_r==0);
        n_bord_r = length(indices_bord_r);

        A(indices_bord_r,:) = sparse(1:n_bord_r,indices_bord_r,ones(n_bord_r,1),n_bord_r,nb_pixels);
        u(:,:,k) = reshape(A\div_g,rows,cols);
        
    end
end

