function I = trapcomp(a, b, N, f)
%
%    I = trapcomp(a, b, N, f)
%
% Formula del trapezio composita
%
% INPUT:
% a,b:   estremi di integrazione
% N:     numero di sottointervalli
% f:     funzione da integrare definita come inline o anonimous
%
% OUTPUT:
% I:     integrale calcolato

h = (b - a) / N;
x = linspace(a, b, N + 1);
y = f(x);
I = h * (0.5 * y(1) + sum(y(2:N)) + 0.5 * y(N + 1));