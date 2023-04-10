function [x,y] = iteration(x,y,Fx,Fy,gamma,A)
    ind = sub2ind([max(round(x)),max(round(y))],round(x),round(y));
    x = A*x - gamma*Fx(ind);
    y = A*y - gamma*Fy(ind);
end

