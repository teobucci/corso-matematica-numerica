function [xvect, niter] = newtonsys(x0, kmax, tol, fun, J)
%
%    [xvect, niter] = newtonsys(x0, kmax, tol, fun, J)
%
% Metodo di Newton per la ricerca degli zeri del sistema
% descritto dalla funzione fun.
% Test d'arresto basato sulla norma infinito dell'incremento
% tra due iterate successive.
%
% INPUT:
% x0:    punto iniziale
% kmax:  numero massimo di iterazioni
% tol:   tolleranza sull'errore
% fun:   anonymous function con la funzione (vettore colonna)
% J:     anonymous function con la jacobiana (vettore colonna)
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
    xnew = xold - J(xold) \ fun(xold);
    % err = abs(xnew - xold);
    err = abs(max(fun(xnew)));
    xvect = [xvect, xnew];
    xold = xnew;
end