clc
clear all
close all
N=input('enter the length of FIR filter');
w=input('enter the upper and lower cutoff frequency');
y=input('enter 1 for rectangular window and 0 for Hamming window');
if (y==1)
    y=rectwin(N+1);
else
    y=hamming(N+1);
end
[b]=fir1(N,w,'bandpass',y);
[H,omega]=freqz(b);
mag=20*log(abs(H));
subplot(4,1,1),plot(omega/pi,mag);
xlabel('Normalized frequency'),ylabel('Magnitude');
title ('Magnitude response BPF');
ph=angle(H);
subplot (4,1,2),plot(omega/pi,ph);
xlabel('Normalized frequency'),ylabel('Phase angle');
title('Phase response BPF');
[b]=fir1(N,w,'stop',y);
[H,omega]=freqz(b);
mag=20*log(abs(H));
subplot (4,1,3),plot(omega/pi, mag);
xlabel('Normalized frequency'),ylabel('Magnitude');
title('Magnitude response BSF');
ph=angle(H);
subplot (4,1,4),plot(omega/pi,ph);
xlabel('Normalized frequency'),ylabel('Phase');
title ('Phase Response BSF');
