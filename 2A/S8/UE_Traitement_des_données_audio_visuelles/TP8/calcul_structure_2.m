function u_kp1 = calcul_structure_2(u_barre,b,Dx,Dy,lambda,epsilon)
    u_k = reshape(u_barre,[size(u_barre,1)*size(u_barre,2),1]);
    n = size(u_k,1);
    I = speye(n);
    Wk = spdiags(1./sqrt((Dx*u_k).^2+(Dy*u_k).^2 + epsilon),0,n,n);
    u_tmp = (I - lambda*(-Dx'*Wk*Dx-Dy'*Wk*Dy))\(b);
    u_kp1 = reshape(u_tmp,[size(u_barre,1),size(u_barre,2)]);
end

