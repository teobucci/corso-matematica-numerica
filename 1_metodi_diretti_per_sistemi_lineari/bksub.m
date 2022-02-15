function x = bksub(A, b)
%
%    x = bksub(A, b)
%
% Algoritmo di sostituzione all'indietro
%
% INPUT:
% A:     matrice triangolare superiore
% b:     vettore termine noto
%
% OUTPUT:
% x:     soluzione

n = length(b);

if ((size(A, 1) ~= n) || (size(A, 2) ~= n))
    error('Errore. Dimensioni incompatibili.')
end

if ~ isequal(A, triu(A))
    error('Errore. Matrice non triangolare superiore.')
end

if (prod(diag(A)) == 0)
    % almeno un elemento diagonale nullo
    error('Errore. Matrice singolare.')
end

x = zeros(n, 1);
x(n) = b(n) / A(n, n);

for i = n-1:-1:1
    x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
end
