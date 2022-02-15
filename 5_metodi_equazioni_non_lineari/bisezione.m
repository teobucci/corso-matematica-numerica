function [xvect, niter] = bisezione(a, b, kmax, tol, fun)
%
%    [xvect, niter] = bisezione(a, b, kmax, tol, fun)
%
% Metodo di bisezione per la risoluzione
% dell'equazione non lineare f(x)=0
%
% INPUT:
% a,b:   estremi dell'intervallo
% kmax:  numero massimo di iterazioni
% tol:   tolleranza sull'errore
% fun:   function da analizzare
%
% OUTPUT:
% xvect: vettore delle iterazioni della soluzione
% niter: numero di iterazioni fatte

if fun(a) * fun(b) > 0
    disp('Gli estremi sono concordi, riprovare.')
else
    niter = 0;
    xattuale = (a + b) / 2;
    xvect = [xattuale];
    err = abs(fun(xattuale));
 
    while (err > tol && niter < kmax)
        niter = niter + 1;
     
        if fun(a) * fun(xattuale) < 0
            b = xattuale;
        elseif fun(xattuale) * fun(b) < 0
            a = xattuale;
        end
     
        xattuale = (a + b) / 2;
        err = abs(fun(xattuale));
        xvect = [xvect; xattuale];
    end
end