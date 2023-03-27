function [u_kp1] = debruitage(b,u_k,lambda,Dx,Dy,epsilon)
    n = size(u_k,1);
    Wk = spdiags(1./sqrt((Dx*u_k).^2+(Dy*u_k).^2 + epsilon),0,n,n);
    u_kp1 = (speye(n) - lambda*(-Dx'*Wk*Dx-Dy'*Wk*Dy))\b;
end

