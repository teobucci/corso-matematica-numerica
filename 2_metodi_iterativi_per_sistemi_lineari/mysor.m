function [x, niter] = mysor(A, b, x0, tol, nmax, omega)
%
%    [x, niter] = mysor(A, b, x0, tol, nmax, omega)
%
% Metodo SOR per sistemi lineari.
% Per omega = 1 si ottiene il metodo di Gauss Seidel.
%
% INPUT:
% A:     matrice del sistema
% b:     vettore termine noto
% x0:    guess iniziale
% tol:   tolleranza criterio d'arresto
% nmax:  numero massimo di iterazioni ammesse
% omega: parametro di rilassamento
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
normb = norm(b);

while niter < nmax && err > tol
    for i = 1:n
        x(i) = (1 - omega) * xv(i) + (omega / A(i, i)) * (b(i) - A(i, 1:i - 1) * x(1:i - 1) - A(i, i + 1:n) * xv(i + 1:n));
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