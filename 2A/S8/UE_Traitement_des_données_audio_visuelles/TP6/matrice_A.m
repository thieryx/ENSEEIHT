function A = matrice_A(N,alpha,beta,gamma)
    e =ones(N,1);
    D = spdiags([e -2*e e],-1:1,N,N);
    D(1,end) = 1;
    D(end,1) = 1;
    A = eye(N) + gamma*(alpha*D-beta*D'*D);
end

