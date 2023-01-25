fo = 1100;
Fe = 10000;
N = 90;
N1 = 256;

Amplitude = zeros(1,N);
Temps = zeros(1,N);
Frequence = zeros(1,N1);
for i = 1:N
    Temps(i) = (1/Fe)*(i-1);
    Amplitude(i) = cos(2*pi*fo*Temps(i));
end

for i = 1:N1
    Frequence(i) = (Fe/N1)*i;
end

figure('Name','Représentation temporelle')
plot(Temps,Amplitude);
xlabel("temps");
ylabel("amplitude");
grid on;



Amplitude_freq = abs(fft(Amplitude,N1));
figure('Name','Représentation fréquentielle')
semilogy(Frequence,Amplitude_freq);
xlabel("frequence");
ylabel("amplitude");
grid on;

DSP_period = ((abs(fft(Amplitude,N1))).^2)/N1;
figure('Name','DSP_period');
plot(Frequence,DSP_period);
xlabel("frequence");
ylabel("DSP");
grid on;

DSP_corr = fft(xcorr(Amplitude,Amplitude),N1);
figure('Name','DSP_corr');
plot(Frequence,DSP_corr);
xlabel("frequence");
ylabel("DSP_corr");
grid on;

DSP_pwelch= pwelch(Amplitude,[],[],[],Fe,'twosided');
figure('Name','DSP_pwelch');
plot(Frequence,DSP_pwelch);
xlabel("frequence");
ylabel("DSP_pwelch");
grid on;
