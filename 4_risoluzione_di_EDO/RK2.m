function [th, uh] = RK2(f, t0, tmax, y0, h)
%
%    [th, uh] = RK2(f, t0, tmax, y0, h)
%
% Risolve il problema di Cauchy
%
% y' = f(t,y)
% y(t0) = y0
%
% utilizzando il metodo Runge-Kutta 2
% u^*_(n+1) = u_n + h * f_n
% u_(n+1) = u_n + h/2 * (f_n + f(t_(n+1), u^*_(n+1)))
%
% INPUT:
% f:     function che descrive il problema di Cauchy
%        Deve ricevere in ingresso due argomenti: f=f(t,y)
% t0:    istante iniziale dell' intervallo temporale di soluzione
% tmax:  istante finale dell' intervallo temporale di soluzione
% y0:    dato iniziale del problema di Cauchy
% h:     ampiezza del passo di discretizzazione temporale.
%
% OUTPUT:
% th:    vettore degli istanti in cui si calcola la soluzione discreta
% uh:    soluzione discreta calcolata nei nodi temporali th

th = t0:h:tmax;
N_istanti = length(th);
uh = zeros(1, N_istanti);
uh(1) = y0;

for it = 2:N_istanti
    u_old = uh(it - 1);
    u_s = u_old + h * f(th(it - 1), u_old);
    uh(it) = u_old + 0.5 * h * (f(th(it - 1), u_old) + f(th(it), u_s));
end