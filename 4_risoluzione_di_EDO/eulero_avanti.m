function [th, uh] = eulero_avanti(f, t0, tmax, y0, h)
%
%    [th, uh] = eulero_avanti(f, t0, tmax, y0, h)
%
% Risolve il problema di Cauchy
%
% y' = f(t,y)
% y(t0) = y0
%
% utilizzando il metodo di Eulero in Avanti
% u_(n+1) = u_n + h * f^n
%
% INPUT:
% f:     function che descrive il problema di Cauchy
%        (dichiarata ad esempio tramite inline o @).
%        Deve ricevere in ingresso due argomenti: f = f(t,y)
% t0:    istante iniziale dell' intervallo temporale di soluzione
% tmax:  istante finale dell' intervallo temporale di soluzione
% y0:    dato iniziale del problema di Cauchy
% h:     ampiezza del passo di discretizzazione temporale.
%
% OUTPUT:
% th:    vettore degli istanti in cui si calcola la soluzione discreta
% uh:    soluzione discreta calcolata nei nodi temporali th

% allocazione del tempo discreto
th = t0:h:tmax;
N = length(th);

% vettore riga con spazio vuoto pronti per partire
uh = zeros(1, N);

% uso la notazione con i ":" in caso uh fosse un vettore, ma qui
% bastava scrivere u(1,1) o addirittura u(1)
uh(:, 1) = y0;

for i = 2:N % parto da 2 cosi' posso considerare il passo precedente
    uh(:, i) = uh(:, i - 1) + h * f(th(i - 1), uh(:, i - 1));
end