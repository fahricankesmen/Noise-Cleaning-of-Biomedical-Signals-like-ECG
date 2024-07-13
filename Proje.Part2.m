
%part a
wb = 2*pi;
%Örnekleme frekansımı Nyquist frekansının oldukça üzerinde olan 500 Hz olarak seçtik
Fs = 400;
Ts = 1/Fs;
%Zaman ve frekans vektörlerinizi tanımladık
t = -3:Ts:3;
f = linspace(-Fs/2,Fs/2, length(t));
%define your signals, i switched my x and h signal to their sinc
%fonksiyon eşdeğeri
x = 2*sinc(wb*t/pi);
p = cos(100*pi*t);
h = 2*sinc(wb*t/pi);
y = x.*p;
w = y.*p;
v = conv(w,h);
%V için yeni zaman ve frekans vektörleri oluşturduk çünkü bunu yapmamız gerekiyor 
%a karmaşık sinyalin uzunluğu var = length(x1) + length(x2)-1
tv = linspace(-3, 3, length(v));
fv = linspace(-Fs/2,Fs/2, length(v));

%Sinyallerimizi frekans alanında tanımladık.
X = fft(x);
X = fftshift(X);
Xabs = abs(X);

P = fft(p);
P = fftshift(P);
Pabs = abs(P);

H = fft(h);
H = fftshift(H);
Habs = abs(H);

Y = fft(y);
Y = fftshift(Y);
Yabs = abs(Y);

W = fft(w);
W = fftshift(W);
Wabs = abs(W);

V = fft(v);
V = fftshift(V);
Vabs = abs(V);

%Sinyallerinizi çiz
figure(1)
subplot(2,1,1);
plot(t,x);
title('x(t) in the time domain');
xlabel('time (sec)');
ylabel('Signal');
subplot(2,1,2);
plot(f,Xabs);
xlim([-3 3]);
title('x(t) in the frequency domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');
sgtitle('Plot of x(t) in time and frequency domain')

figure(2)
subplot(2,1,1)
plot(t,p);
xlim([-.1 .1]);
title('p(t) in the time domain');
xlabel('time (sec)');
ylabel('Signal');
subplot(2,1,2);
plot(f,Pabs);
xlim([-60 60]);
title('p(t) in the frequency domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');
sgtitle('Plot of p(t) in time and frequency domain');

figure(3)
subplot(2,1,1)
plot(t,y);
xlim([-3 3]);
title('y(t) in the time domain');
xlabel('time (sec)');
ylabel('Signal');
subplot(2,1,2);
plot(f,Yabs);
xlim([-60 60]);
title('y(t) in the frequency domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');
sgtitle('Plot of y(t) in time and frequency domain');

figure(4)
subplot(2,1,1)
plot(t,w);
xlim([-3 3]);
title('w(t) in the time domain');
xlabel('time (sec)');
ylabel('Signal');
subplot(2,1,2);
plot(f,Wabs);
xlim([-110 110]);
title('w(t) in the frequency domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');
sgtitle('Plot of w(t) in time and frequency domain');

figure(5)
subplot(2,1,1)
plot(tv,v);
title('v(t) in the time domain');
xlabel('time (sec)');
ylabel('Signal');
subplot(2,1,2);
plot(fv,Vabs);
xlim([-3 3]);
title('v(t) in the frequency domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');
sgtitle('Plot of v(t) in time and frequency domain');



