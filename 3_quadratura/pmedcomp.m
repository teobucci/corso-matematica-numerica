function I = pmedcomp(a, b, N, f)
%
%    I = pmedcomp(a, b, N, f)
%
% Formula del punto medio composita
%
% INPUT:
% a,b:   estremi di integrazione
% N:     numero di sottointervalli
% f:     funzione da integrare definita come inline o anonimous
%
% OUTPUT:
% I:     integrale calcolato

h = (b - a) / N;
xM = [a + h / 2:h:b - h / 2];
fxM = f(xM);
I = h * sum(fxM);