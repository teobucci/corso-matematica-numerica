function [x, niter] = myjacobi(A, b, x0, tol, nmax)
%
%    [x, niter] = myjacobi(A, b, x0, tol, nmax)
%
% Metodo di Jacobi per sistemi lineari.
%
% INPUT:
% A:     matrice del sistema
% b:     vettore termine noto
% x0:    guess iniziale
% tol:   tolleranza criterio d'arresto
% nmax:  numero massimo di iterazioni ammesse
%
% OUTPUT:
% x:     soluzione
% niter: numero di iterazioni

[n, m] = size(A);
if n ~= m
    error('Errore. Dimensioni incompatibili.')
end

xv = x0;
x = x0;
niter = 0;
err = tol + 1;

while niter < nmax && err > tol
    for i = 1:n
        x(i) = (b(i) - A(i, [1:i - 1, i + 1:n]) * xv([1:i - 1, i + 1:n])) / A(i, i);
    end
    niter = niter + 1;
    err = norm(b - A * x) / norm(b);
    xv = x;
end

if niter == nmax
    disp('Il metodo non converge in %d iterazioni \n', niter);
else
    disp('Il metodo converge in %d iterazioni \n', niter);
end