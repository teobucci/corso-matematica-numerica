function [th, uh] = heun(f, t0, tmax, y0, h)
%
%    [th, uh] = heun(f, t0, tmax, y0, h)
%
% Risolve il problema di Cauchy
%
% y' = f(t,y)
% y(t0) = y0
%
% utilizzando il metodo di Heun
% u_(n+1) = u_n + h/2 * (f^{n+1} + f(t,u_n + h f^n))
%
% INPUT:
% f:     function che descrive il problema di Cauchy
%        (dichiarata ad esempio tramite inline o @).
%        Deve ricevere in ingresso due argomenti: f=f(t,y)
% t0:    istante iniziale dell' intervallo temporale di soluzione
% tmax:  istante finale dell' intervallo temporale di soluzione
% y0:    dato iniziale del problema di Cauchy
% h:     ampiezza del passo di discretizzazione temporale.
%
% OUTPUT:
% th:    vettore degli istanti in cui si calcola la soluzione discreta
% uh:    soluzione discreta calcolata nei nodi temporali th

it = 1;
th(it) = t0;
uh(it) = y0;
for it = 2:(tmax - t0) / h + 1
    th(it) = th(it - 1) + h;
    uh(it) = uh(it - 1) + h / 2 * (f(th(it - 1), uh(it - 1)) + f(th(it), uh(it - 1) + h * f(th(it - 1), uh(it - 1))));
end