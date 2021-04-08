clc
close all
clear all
n=[0:0.01:1];
f=sin(2*pi*n);
subplot(2,1,1);
stem(n,f);
xlabel('time');
ylabel('amplitude');
title('Sine signal');
n=[0:0.01:1];
f=cos(2*pi*n);
subplot(2,1,2);
stem(n,f);
xlabel('time');
ylabel('amplitude');
title('Cos signal');
