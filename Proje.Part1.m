% Load the data
load('noisyECGMiniProject3.mat');

% Plot the noisy ECG signal in the time domain
figure(1);
plot(t, noisyECG);
xlabel('Time (sec)');
ylabel('ECG Signal');
title('Noisy ECG Signal in the Time Domain');

% Determine the sampling frequency and period
Fs = 1000 / max(t);
Ts = 1 / Fs;

% Compute the frequency vector for the magnitude spectrum
f = linspace(-Fs/2, Fs/2, length(noisyECG));

% Compute the FFT and magnitude spectrum of the noisy ECG signal
FreqSig = fft(noisyECG);
FreqSig = fftshift(FreqSig);
MagF = abs(FreqSig);

% Plot the magnitude spectrum of the noisy ECG signal
figure(2);
plot(f, MagF);
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');
title('Magnitude Spectrum of Noisy ECG Signal');

% Design a low-pass filter
filterDesigner
Fpass = 9; % Passband frequency
Fstop = 15; % Stopband frequency
Apass = 1; % Passband ripple (dB)
Astop = 80; % Stopband attenuation (dB)
d = designfilt('lowpassiir', 'PassbandFrequency', Fpass, ...
               'StopbandFrequency', Fstop, 'PassbandRipple', Apass, ...
               'StopbandAttenuation', Astop, 'SampleRate', Fs);

% Plot the frequency response of the filter
figure(3);
freqz(d);
title('Frequency Response of the Low-Pass Filter');

% Filter the noisy ECG signal
Filtt = filter(d, noisyECG);
Filtf = fft(Filtt);
Filtf = fftshift(Filtf);
Mag2 = abs(Filtf);

% Plot the cleaned signal in both time and frequency domains
figure(4);
subplot(2,1,1);
plot(t, Filtt);
title('Cleaned ECG Signal in Time Domain');
ylabel('ECG Signal');
xlabel('Time (sec)');

subplot(2,1,2);
plot(f, Mag2);
xlim([-20 20]);
title('Cleaned ECG Signal in Frequency Domain');
ylabel('Magnitude Spectrum');
xlabel('Frequency (Hz)');

sgtitle('Clean ECG Signal');