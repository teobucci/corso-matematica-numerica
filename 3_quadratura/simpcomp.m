function I = simpcomp(a, b, N, f)
%
%    I = simpcomp(a, b, N, f)
%
% Formula di Simpson composita
%
% INPUT:
% a,b:   estremi di integrazione
% N:     numero di sottointervalli
% f:     funzione da integrare definita come inline o anonimous
%
% OUTPUT:
% I:     integrale calcolato

h = (b - a) / N;
xL = [a:h:b - h];
xM = [a + h / 2:h:b - h / 2];
xR = [a + h:h:b];
I = h / 6 * sum(f(xL) + 4 * f(xM) + f(xR));