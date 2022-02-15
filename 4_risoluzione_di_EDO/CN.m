function [th, uh, iter_pf] = CN(f, t0, tmax, y0, h)
%
%    [th, uh, iter_pf] = CN(f, t0, tmax, y0, h)
%
% Risolve il problema di Cauchy
%
% y' = f(t,y)
% y(t0) = y0
%
% utilizzando il metodo di Crank-Nicolson
% u_(n+1) = u_n + h/2 * (f^{n} + f^{n+1})
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

th = t0:h:tmax;
N = length(th);
uh = zeros(1, N);
uh(1) = y0;

Nmax = 1000;
toll = 1e - 9;
iter_pf = zeros(1, N);

for it = 2:N
    phi = @(u) uh(it - 1) + h / 2 * (f(th(it - 1), uh(it - 1)) + f(th(it), u));
    j = 0; err = toll + 1;
    w0 = uh(it - 1);

    while err > toll && j < Nmax
        w1 = phi(w0);
        err = abs(w1 - w0);
        j = j + 1;
        w0 = w1;
    end
    
    iter_pf(it) = j;
    uh(it) = w1;
end