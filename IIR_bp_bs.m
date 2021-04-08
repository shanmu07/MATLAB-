% IIR filters - BPF & BSF
clc
clear ALL
close all

Rp = input('Enter passband attenuation:');
Rs = input('Enter stopband attenuation:');
Wp = input('Enter Wp:');
Ws = input('Enter Ws:');
Fs = input('Enter sampling frequency:');
y = input('Enter 1 for butterworth & 0 for Chebysev filter: ');

W1 = 2 * Wp/Fs ;
W2 = 2 * Ws/Fs ;
if(y == 1)
    [N] = buttord(W1, W2, Rp, Rs);
else
    [N] = cheb1ord(W1, W2, Rp, Rs);
end

Wn = [W1,W2];
if(y == 1)
    [b,a] = butter(N,Wn,"bandpass");
else
    [b,a] = cheby1(N,Rp,Wn,"bandpass");
end
w = 0:0.01:pi ;
[H,omega] = freqz(b,a,w);
mag = 20 * log(abs(H));
subplot(4,1,1), plot(omega/pi, mag);
xlabel('Normalised Frequency'), ylabel('Magnitude');
title('MAGNITUDE RESPONSE-BANDPASS');
ph = angle(H);
subplot(4,1,2), plot(omega/pi, ph);
xlabel('Normalised Frequency'), ylabel('Phase');
title('PHASE RESPONSE-BANDPASS')
if(y == 1)
    [b,a] = butter(N,Wn,"stop");
else
    [b,a] = cheby1(N,Rp,Wn,"stop");
end
w = 0:0.01:pi ;
[H,omega] = freqz(b,a,w);
mag = 20 * log(abs(H));
subplot(4,1,3), plot(omega/pi, mag);
xlabel('Normalised Frequency'), ylabel('Magnitude');
title('MAGNITUDE RESPONSE-BANDSTOP');
ph = angle(H);
subplot(4,1,4), plot(omega/pi, ph);
xlabel('Normalised Frequency'), ylabel('Phase');
title('PHASE RESPONSE-BANDSTOP')
