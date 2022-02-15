function [xvect, niter] = newton(x0, kmax, tol, fun, dfun, mol)
%
%    [xvect, niter] = newton(x0, kmax, tol, fun, dfun, mol)
%
% Metodo di Newton per la ricerca degli zeri della funzione
% fun. Test d'arresto basato sull'incremento tra due
% iterazioni successive.
%
% INPUT:
% x0:    punto iniziale
% kmax:  numero massimo di iterazioni
% tol:   tolleranza sull'errore
% fun:   anonymous function con la funzione
% dfun:  anonymous function con la derivata
% mol:   molteplicita' dello zero che si vuole trovare
%
% OUTPUT:
% xvect: vettore delle iterazioni della soluzione
% niter: numero di iterazioni fatte

err = tol + 1;
niter = 0;
xvect = x0;
xold = x0;

while (err > tol && niter < kmax)
    niter = niter + 1;
 
    dfx = dfun(xold);
    if dfx == 0
        disp('derivata nulla!');
        return
    end
 
    xnew = xold - mol * fun(xold) / dfx;
    % err = abs(xnew - xold);
    err = abs(fun(xnew));
    xvect = [xvect; xnew];
    xold = xnew;
end