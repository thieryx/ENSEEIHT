clear all;
f1 = 1000;
f2 = 3000;
Fe = 10000;
Te = 1/Fe;
N = 100;
fc = 2000;
N0_1 = 30;
N0_2 = 30;

Amplitude = zeros(1,N);
Temps = zeros(1,N);
Frequence = zeros(1,N);
for i = 1:N
    Temps(i) = (1/Fe)*(i-1);
    Amplitude(i) = cos(2*pi*f1*Temps(i))+cos(2*pi*f2*Temps(i));
end

for i = 1:N
    Frequence(i) = (Fe/N)*i;
end


Amplitude_rep_imp_1 = zeros(1,2*N0_1+1);
Temps_rep_imp = zeros(1,2*N0_1+1);
Frequence_rep_imp = zeros(1,2*N0_1+1);
pas=(2*(Fe/2)+1)/(2*N0_1+1);
cpt = -N0_1-1;
for i = 1:2*N0_1+1
    Temps_rep_imp_1(i) = Te*(i-1-N0_1);
    Amplitude_rep_imp_1(i) = 2*fc*Te*sinc(2*fc*(cpt+i)*Te);
    Frequence_rep_imp_1(i) = -(Fe/2) + pas*(i-1);
end

Amplitude_rep_imp_2 = zeros(1,2*N0_2+1);
Temps_rep_imp_2 = zeros(1,2*N0_2+1);
Frequence_rep_imp_2 = zeros(1,2*N0_2+1);
pas=(2*(Fe/2)+1)/(2*N0_2+1);
cpt = -N0_2-1;
for i = 1:2*N0_2+1
    Temps_rep_imp_2(i) = Te*(i-1-N0_2);
    Amplitude_rep_imp_2(i) = 2*fc*Te*sinc(2*fc*(cpt+i)*Te);
    Frequence_rep_imp_2(i) = -(Fe/2) + pas*(i-1);
end

Amplitude_filter = filter(Amplitude_rep_imp_2, 1, Amplitude);

figure('Name','Représentation temporelle')
plot(Temps_rep_imp_1,Amplitude_rep_imp_1);
xlabel("temps");
ylabel("amplitude");
grid on;

Amplitude_freq = abs((fft(Amplitude_filter,2*N0_2+1)));
figure('Name','Représentation fréquentielle')
plot(Frequence_rep_imp_2,Amplitude_freq);
xlabel("frequence");
ylabel("amplitude");
grid on;

hold on;

Amplitude_freq_1 = abs((fftshift(fft(Amplitude_rep_imp_1,2*N0_2+1))));
plot(Frequence_rep_imp_2,Amplitude_freq_1);

hold on;

Amplitude_freq_2 = abs(((fftshift(fft(Amplitude_rep_imp_2,2*N0_2+1)))));
plot(Frequence_rep_imp_2,Amplitude_freq_2);

legend('Somme de cos de fréquence f1 et f2','Réponse impulsionnelle ordre 1', 'Réponse impulsionnelle ordre 2')

