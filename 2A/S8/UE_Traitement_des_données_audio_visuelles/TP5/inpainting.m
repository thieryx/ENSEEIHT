function [u_kp1] = inpainting(b,u_k,lambda,Dx,Dy,epsilon, defaut)
    n = size(u_k,1);
    vec_defaut = reshape(defaut/255,[n 1]);
    Wk = spdiags(1./sqrt((Dx*u_k).^2+(Dy*u_k).^2 + epsilon),0,n,n);
    W_defaut = spdiags(1-vec_defaut,0,n,n);
    u_kp1 = (W_defaut - lambda*(-Dx'*Wk*Dx-Dy'*Wk*Dy))\(W_defaut*b);
end

