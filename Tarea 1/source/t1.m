%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% [ELO313] Procesamiento Digital de Señales %%%%%
%%%%% Tarea 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


n = 1:30;

%%% Generando señal $\mu(10)-\mu(20)$ %%%
x = zeros(1,30);
for i = 1:30
    if i>=10 && i<=20
        x(i) = 1;
    end
end

%%% Generando señal con retraso %%%
x1 = zeros(1,30);
for i = 1:30
    if i>=15 && i<=25
        x1(i) = 1;
    end
end

y11 = bbox1(x);
y12 = bbox1(x1);
plot(n,y11,'r:s', n, y12, 'b--*');
legend('step', 'step with delay');
grid;
title('Respuesta a escalón con retraso');
xlabel('n');
ylabel('bbox1[n]');