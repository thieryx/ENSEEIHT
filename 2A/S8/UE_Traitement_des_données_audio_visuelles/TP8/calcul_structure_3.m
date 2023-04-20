function u_kp1 = calcul_structure_3(u_barre,u,Dx,Dy,Phi,epsilon,mu_prime,gamma)
    [r,c] = size(u_barre);
    u_barre_reshaped = reshape(u_barre,[size(u_barre,1)*size(u_barre,2),1]);
    u_reshaped = reshape(u,[r*c,1]);
    ux_barre = Dx*u_barre_reshaped;
    uy_barre = Dy*u_barre_reshaped;
    uxx_barre = -Dx'*Dx*u_barre_reshaped;
    uxy_barre = -Dx'*Dy*u_barre_reshaped;
    uyy_barre = -Dy'*Dy*u_barre_reshaped;

    div = (uxx_barre.*(uy_barre.^2+epsilon) + uyy_barre.*(ux_barre.^2+epsilon) - 2*ux_barre.*uy_barre.*uxy_barre)./(ux_barre.^2+uy_barre.^2+epsilon).^(3/2);
    div = reshape(div, [r,c]);
    tf_u_barre = fftshift(fft2(u_barre));
    tf_u = fftshift(fft2(u));
    tf = real(ifft2(ifftshift(Phi.*(tf_u_barre-tf_u))));
    u_kp1 = u_barre - gamma*( tf -mu_prime*div);
end

