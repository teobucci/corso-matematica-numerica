function [xvect, niter] = corde(a, b, x0, kmax, tol, fun)
%
%    [xvect, niter] = corde(a, b, x0, kmax, tol, fun)
%
% Metodo delle corde per la risoluzione
% dell'equazione non lineare f(x)=0
%
% INPUT:
% a,b:   estremi dell'intervallo
% x0:    punto iniziale
% kmax:  numero massimo di iterazioni
% tol:   tolleranza sull'errore
% fun:   function da analizzare
%
% OUTPUT:
% xvect: vettore delle iterazioni della soluzione
% niter: numero di iterazioni fatte

fa = fun(a);
fb = fun(b);
rappinc = (fb - fa) / (b - a);
err = tol + 1;
niter = 0;
xvect = x0;
xold = x0;

while (err > tol && niter < kmax)
    niter = niter + 1;
    xnew = xold - fun(xold) / rappinc;
    % err = abs(xnew - xold);
    err = abs(fun(xnew));
    xvect = [xvect; xnew];
    xold = xnew;
end