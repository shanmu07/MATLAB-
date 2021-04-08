% IIR filters - LPF & HPF
clc
clear ALL
close all

Rp = input('Enter passband attenuation:');
Rs = input('Enter stopband attenuation:');
Wp = input('Enter Wp:');
Ws = input('Enter Ws:');
Fs = input('Enter the sampling frequency:');
y = input('Enter 1 for butterworth & 0 for Chebysev filter: ');

W1 = 2 * Wp/Fs ;
W2 = 2 * Ws/Fs ;
if (y==1)
    [N,Wn] = buttord(W1, W2, Rp, Rs);
else
    [N,Wn] = cheb1ord(W1, W2, Rp, Rs);
end

if (y==1)
    [b,a] = butter(N,Wn,"low");
else
    [b,a] = cheby1(N,Rp,Wn,"low");
end
w = 0:0.01:pi ;
[H,omega] = freqz(b,a,w);
mag = 20 * log(abs(H));
subplot(4,1,1), plot(omega/pi, mag);
xlabel('Normalised Frequency'), ylabel('Magnitude');
title('MAGNITUDE RESPONSE-LPF');
ph = angle(H);
subplot(4,1,2), plot(omega/pi, ph);
xlabel('Normalised Frequency'), ylabel('Phase');
title('PHASE RESPONSE-LPF')

if (y==1)
    [b,a] = butter(N,Wn,"high");
else
    [b,a] = cheby1(N,Rp,Wn,"high");
end
w = 0:0.01:pi ;
[H,omega] = freqz(b,a,w);
mag = 20 * log(abs(H));
subplot(4,1,3), plot(omega/pi, mag);
xlabel('Normalised Frequency'), ylabel('Magnitude');
title('MAGNITUDE RESPONSE-HPF');
ph = angle(H);
subplot(4,1,4), plot(omega/pi, ph);
xlabel('Normalised Frequency'), ylabel('Phase');
title('PHASE RESPONSE-HPF');
