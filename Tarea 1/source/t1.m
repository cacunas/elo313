%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% [ELO313] Procesamiento Digital de Señales %%%%%
%%%%% Tarea 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xi=1;
xf=30;

n = xi:xf;

%%% Generando señal $\mu(10)-\mu(20)$ %%%
x = zeros(xi,xf);
for i = xi:xf
    if i>=(xf/3) && i<=(2*xf/3)
        x(i) = 1;
    end
end

%%% Generando señal con retraso %%%
x1 = zeros(xi,xf);
for i = xi:xf
    if i>=(xf/3)+(xf/6) && i<=(2*xf/3)+(xf/6)
        x1(i) = 1;
    end
end

%%% Probando invariencia en el tiempo para bbox1 %%%
y11 = bbox1(x)';
y12 = bbox1(x1);
img=figure(1);
plot(n,y11,'r-s',n,y12,'b-*');
legend('escalón', 'escalón con retraso');
grid;
title('Respuesta de bbox1 a escalón con retraso');
xlabel('n');
ylabel('bbox1[n]');
saveas(img,'../img/img1.png');

%%% Probando invariencia en el tiempo para bbox2 %%%
y21 = bbox2(x);
y22 = bbox2(x1);
img=figure(2);
plot(n,y21,'r-s',n, y22,'b-*');
legend('escalón', 'escalón con retraso');
grid;
title('Respuesta de bbox2 a escalón con retraso');
xlabel('n');
ylabel('bbox2[n]');
saveas(img,'../img/img2.png');

%%% Probando invariencia en el tiempo para bbox3 %%%
y31 = bbox3(x);
y32 = bbox3(x1);
img=figure(3);
plot(n,y31,'r-s', n, y32, 'b-*');
legend('escalón', 'escalón con retraso');
grid;
title('Respuesta de bbox3 a escalón con retraso');
xlabel('n');
ylabel('bbox3[n]');
saveas(img,'../img/img3.png');








