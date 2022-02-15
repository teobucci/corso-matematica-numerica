function [xvect, niter] = punto_fisso(phi, x0, tol, kmax)
%
%    [xvect, niter] = punto_fisso(phi, x0, tol, kmax)
%
% Trova un punto fisso della funzione phi
% usando il metodo delle iterazioni di punto fisso
% e restituisce un vettore xvect contenente le iterate del metodo.
%
% INPUT:
% phi:   funzione scalare che accetta una variabile scalare in input
% x0:    approssimazione iniziale
% tol:   tolleranza per il criterio d'arresto (basato sull'incremento)
%        conviene questo criterio perche' in input c'e' phi
% kmax:  numero massimo di iterazioni concesso
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
    xnew = phi(xold);
    err = norm(xnew - xold);
    xvect = [xvect, xnew];
    xold = xnew;
end