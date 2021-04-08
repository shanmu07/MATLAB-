clc
clear all
close all
n=[-10:1:10];
a=[zeros(1,10) ones(1,1) zeros(1,10)];
subplot(4,2,1)
stem(n,a);
xlabel('Time')
ylabel('Amplitude')
title('Unit Impulse Signal')
n1=[0:1:10];
a1=[ones(1,11)];
subplot(4,2,2);
stem(n1,a1);
xlabel('time');
ylabel('amplitude')
title('Unit Step Signal');
n2=[0:1:10];
subplot(4,2,3);
stem(n2,n2);
xlabel('time');
ylabel('amplitude');
title('Ramp Signal');
n=[0:0.01:1];
f=sin(2*pi*n);
subplot(4,2,4);
stem(n,f);
xlabel('time');
ylabel('amplitude');
title('Sine signal');
n=[0:0.01:1];
f=cos(2*pi*n);
subplot(4,2,5);
stem(n,f);
xlabel('time');
ylabel('amplitude');
title('Cos signal');
n=0:1:10;
a=rand(1,11);
subplot(4,2,6),stem(n,a);
xlabel('Time in sec');
ylabel('Amplitude');
title('Random signal');
n=(0:1:10);
a=exp(n);
subplot(4,1,4),stem(n,a);
xlabel('Time'),ylabel('Amplitude');
title('Exponential response');
