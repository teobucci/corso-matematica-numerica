function x = fwsub(A, b)
%
%    x = fwsub(A, b)
%
% Algoritmo di sostituzione in avanti
%
% INPUT:
% A:     matrice triangolare inferiore
% b:     vettore termine noto
%
% OUTPUT:
% x:     soluzione

n = length(b);

if ((size(A, 1) ~= n) || (size(A, 2) ~= n))
    error('Errore. Dimensioni incompatibili.')
end

if ~ isequal(A, tril(A))
    error('Errore. Matrice non triangolare inferiore.')
end

if (prod(diag(A)) == 0)
    % almeno un elemento diagonale nullo
    error('Errore. Matrice singolare.')
end

x = zeros(n, 1);
x(1) = b(1) / A(1, 1);

for i = 2:n
    x(i) = (b(i) - A(i, 1:i-1) * x(1:i-1)) / A(i, i);
end