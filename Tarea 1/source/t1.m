%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% [ELO313] Procesamiento Digital de Señales %%%%%
%%%%% Tarea 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Invariacia en el Tiempo %%%%%%%%%%%%%%%%%%%%%%%%%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Linealidad %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% señales de prueba x1 y x2
x1 = x;
x2 = sin(n/3);

%%% Prueba para bbox1
img=figure(4);

subplot(2,2,1);
y11 = bbox1(x1);
plot(n,y11,'r-s');
xlabel('n');
title('Respuesta de bbox1 a escalón');
grid;

subplot(2,2,2);
y12 = bbox1(x2);
plot(n,y12,'b-*');
xlabel('n');
title('Respuesta de bbox1 a sinusoide');
grid;

subplot(2,2,3);
y13 = y11 + y12;
plot(n,y13,'r-^');
xlabel('n');
title('Suma de respuesta a escalón y a sinusoide');
grid;

subplot(2,2,4);
y14 = bbox1(x1+x2);
plot(n,y14,'b-^');
xlabel('n');
title('Respuesta de suma de escalón y sinusoide');
grid;

saveas(img,'../img/img4.png');


%%% Prueba para bbox2
img=figure(5);

subplot(2,2,1);
y11 = bbox2(x1);
plot(n,y11,'r-s');
xlabel('n');
title('Respuesta de bbox2 a escalón');
grid;

subplot(2,2,2);
y12 = bbox2(x2);
plot(n,y12,'b-*');
xlabel('n');
title('Respuesta de bbox2 a sinusoide');
grid;

subplot(2,2,3);
y13 = y11 + y12;
plot(n,y13,'r-^');
xlabel('n');
title('Suma de respuesta a escalón y a sinusoide');
grid;

subplot(2,2,4);
y14 = bbox2(x1+x2);
plot(n,y14,'b-^');
xlabel('n');
title('Respuesta de suma de escalón y sinusoide');
grid;

saveas(img,'../img/img5.png');


%%% Prueba para bbox3
img=figure(6);

subplot(2,2,1);
y11 = bbox3(x1);
plot(n,y11,'r-s');
xlabel('n');
title('Respuesta de bbox3 a escalón');
grid;

subplot(2,2,2);
y12 = bbox3(x2);
plot(n,y12,'b-*');
xlabel('n');
title('Respuesta de bbox3 a sinusoide');
grid;

subplot(2,2,3);
y13 = y11 + y12;
plot(n,y13,'r-^');
xlabel('n');
title('Suma de respuesta a escalón y a sinusoide');
grid;

subplot(2,2,4);
y14 = bbox3(x1+x2);
plot(n,y14,'b-^');
xlabel('n');
title('Respuesta de suma de escalón y sinusoide');
grid;

saveas(img,'../img/img6.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Causalidad y Estabilidad BIBO %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% señal Delta Kronecker
x = zeros(xi,xf);
x(floor((xf-xi)/2)) = 1;

% Excitaciones de bbox1 a D_k
y = bbox1(x);

img = figure(7);
plot(n,y,'r-s');
xlabel('n');
title('Respuesta a impulso bbox1');
grid;

saveas(img,'../img/img7.png');


% Excitaciones de bbox2 a D_k
y = bbox2(x);

img = figure(8);
plot(n,y,'r-s');
xlabel('n');
title('Respuesta a impulso bbox2');
grid;

saveas(img,'../img/img8.png');

% Excitaciones de bbox3 a D_k
y = bbox3(x);

img = figure(9);
plot(n,y,'r-s');
xlabel('n');
title('Respuesta a impulso bbox3');
grid;

saveas(img,'../img/img9.png');


