function [th, uh] = eulero_indietro(a, b, t0, tmax, y0, h)
%
%    [th, uh] = eulero_indietro(a, b, t0, tmax, y0, h)
%
% Risolve il problema di Cauchy
%
% y' = f(t,y) = a(t)y + b(t)
% y(t0) = y0
%
% utilizzando il metodo di Eulero Indietro
% u_(n+1) = u_n + h * f^{n+1}.
%
% INPUT:
% a,b:   parametri della funzione f(y,t) = a(t)y + b(t)
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

uh = zeros(1, N);

% uso la notazione con i ":" in caso uh fosse un vettore, ma qui
% bastava scrivere u(1,1) o addirittura u(1)
uh(:, 1) = y0;

% passaggi
% u_n+1 = u_n + hf(t_n+1,u_n+1)
% u_n+1 = u_n + h[a(t_n+1)u_n+1 + b(t_n+1)]
% u_n+1 = u_n + h*a(t_n+1)u_n+1 + h*b(t_n+1)
% u_n+1 - h*a(t_n+1)u_n+1 = u_n + h*b(t_n+1)
% u_n+1*[1 - h*a(t_n+1)] = u_n + h*b(t_n+1)
% u_n+1 = [u_n + h*b(t_n+1)]/[1 - h*a(t_n+1)]

for i = 2:N
    uh(:, i) = (uh(:, i - 1) + h * b(th(i))) ./ (1 - h * a(th(i)));
end