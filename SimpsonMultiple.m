% Intervalo y función
a = 0;
b = 0.8;
n = 6; % Debe ser par
h = (b - a) / n;

% Definir la función
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

% Puntos de evaluación
x = a:h:b;
y = f(x);

% Aplicación de la regla de Simpson 1/3 compuesta
I_aprox = h/3 * (y(1) + ...
    4 * sum(y(2:2:end-1)) + ...
    2 * sum(y(3:2:end-2)) + ...
    y(end));

% Derivada cuarta de f(x): f4(x) = 12150 - 129600x + 96000x^2
f4 = @(x) 12150 - 129600*x + 96000*x.^2;

% Valor medio de la cuarta derivada en [a,b]
media_f4 = integral(f4, a, b) / (b - a);

% Error de truncamiento estimado
error_trunc = -((b - a)^5 / (180 * n^4)) * media_f4;

% Valor exacto dado
I_real = 1.640533;

% Error relativo porcentual
error_rel = abs((I_real - I_aprox) / I_real) * 100;

% Mostrar resultados
fprintf('Integral aproximada (Simpson 1/3 compuesta): %.6f\n', I_aprox);
fprintf('Media de la cuarta derivada: %.6f\n', media_f4);
fprintf('Error de truncamiento estimado: %.6f\n', error_trunc);
fprintf('Error relativo porcentual: %.4f%%\n', error_rel);
