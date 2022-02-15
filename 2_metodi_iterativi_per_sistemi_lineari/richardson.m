function [x, niter] = richardson(A, b, x0, tol, nmax, P, alpha)
%
%    [x, niter] = richardson(A, b, x0, tol, nmax, P, alpha)
%
% Metodo di Richardson stazionario precondizionato.
%
% INPUT:
% A:     matrice del sistema
% b:     vettore termine noto
% P:     precondizionatore
% x0:    guess iniziale
% tol:   tolleranza criterio d'arresto
% nmax:  numero massimo di iterazioni ammesse
% alpha: parametro di accelerazione
%
% OUTPUT
% x:     soluzione
% niter: numero di iterazioni

n = length(b);
if ((size(A, 1) ~= n) || (size(A, 2) ~= n) || (length(x0) ~= n))
    error('Errore. Dimensioni incompatibili.')
end

x = x0;
niter = 0;
r = b - A * x;
res_normalizzato = norm(r) / norm(b);

while ((res_normalizzato > tol) && (niter < nmax))
    z = P \ r;
    x = x + alpha * z;
    r = b - A * x; % equivalente a: r = r - alpha * A * z;
    res_normalizzato = norm(r) / norm(b);
    niter = niter + 1;
end

if niter == nmax
    disp('Il metodo non converge in %d iterazioni \n', niter);
else
    disp('Il metodo converge in %d iterazioni \n', niter);
end