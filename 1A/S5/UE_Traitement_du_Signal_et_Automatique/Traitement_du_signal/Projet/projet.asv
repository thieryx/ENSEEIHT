% Projet de Traitement numérique du Signal : Simulation d'une transmission au format DVB-RCS
% Nom : Xu
% Prénom : Thierry
% Nom : Gouilloud
% Prénom : Clément
% Groupe : 1SN-I

clear all;
close all;

% Téléchargement des données
load donnees1.mat
load donnees2.mat


% Paramètres
Fe = 1.2*10^5;
Te = 1/Fe;
Fp1 = 0;
Fp2 = 4.6*10^4;
T = 40*10^-3;
Ns = Fe*(T/length(bits_utilisateur1));
SNR = 20;
fc =  2.3*10^4;
N = 100;   %Ordre du filtre 


% Génération de m1 et m2
m1 = kron(2*bits_utilisateur1 - 1, ones(1,Ns));
m2 = kron(2*bits_utilisateur2 - 1, ones(1,Ns));


% Echelle temporelle
temps = [0:Te:(length(m1)-1)*Te];


% Affichage de m1
figure('Name','Représentation temporelle de m1 et m2 et de leur DSP');
subplot(2,2,1);
plot(temps,m1);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('m1(t)','Interpreter','latex','FontSize',15);
title('Signal m1(t)','Interpreter','latex','FontSize',20);


% Affichage de m2
subplot(2,2,2);
plot(temps,m2);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('m2(t)','Interpreter','latex','FontSize',15);
title('Signal de m2(t)','Interpreter','latex','FontSize',20)


% Calcul des DSP de m1 et m2
DSP1 = (abs(fft(m1)).^2);
DSP2 = (abs(fft(m2)).^2);


% Echelle fréquentielle
frequence = [-Fe/2:Fe/(length(DSP1)-1):Fe/2];


% Affichage de la DSP de m1
subplot(2,2,3);
plot(frequence,fftshift(DSP1));
xlabel("Frequence en Hz",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('DSP de m1(t)','Interpreter','latex','FontSize',15);
title('Densite spectrale de puissance de m1','Interpreter','latex','FontSize',20)


% Affichage de la DSP de m2
title('Densite spectrale de puissance de m2','Interpreter','latex','FontSize',20)
subplot(2,2,4);
plot(frequence,fftshift(DSP2));
xlabel("Frequence en Hz",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('DSP de m2(t)','Interpreter','latex','FontSize',15);
title('Densite spectrale de puissance de m2','Interpreter','latex','FontSize',20);


% Génération  et affichage du signal 1 et de x1
signal1 = [zeros(1,length(m1)), m1, zeros(1, 3*length(m1))];
temps_signal = [0:Te:(length(signal1)-1)*Te];
x1 = cos(2*pi*Fp1*temps_signal).*signal1;
figure('Name','Représentation temporelle du message au slot 2 et au slot 5');
subplot(2,1,1);
plot(temps_signal,x1);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('signal 1','Interpreter','latex','FontSize',15);
title('Signal x1(t)','Interpreter','latex','FontSize',20);


% Génération et affichage du signal 2 et de x2
signal2 = [ zeros(1, 4*length(m2)), m2];
x2 = cos(2*pi*Fp2*temps_signal).*signal2;
subplot(2,1,2);
plot(temps_signal,signal2);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('signal 2','Interpreter','latex','FontSize',15);
title('Signal x2(t)','Interpreter','latex','FontSize',20);


% Génération et affichage du signal MF-TDMA
signal = x1+x2;
Puiss_signal = mean(abs(signal).^2);
Puiss_bruit = Puiss_signal*10^(-SNR/10);
sigma = sqrt(Puiss_bruit);
bruit_gauss = sigma*randn(1,length(signal));
signal_MF_TDMA = signal + bruit_gauss;

figure('Name','Représentation temporelle et densite spectrale de puissance du signal MF_TDMA');
subplot(3,1,1);
plot(temps_signal,signal_MF_TDMA);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('signal MF\_TDMA','Interpreter','latex','FontSize',15);
title('Signal MF\_TDMA','Interpreter','latex','FontSize',20);


% Calcul de la densité spectrale de puissance du signal MF_TDMA
% DSP_MF_TDMA = pwelch(signal,[],[],[],Fe,'twosided');
DSP_MF_TDMA = (abs(fft(signal_MF_TDMA)).^2);


% Echelle fréquentielle
frequence_MF_TDMA = [-Fe/2:Fe/(length(DSP_MF_TDMA)-1):Fe/2];


% Affichage de la densité spectrale de puissance du signal MF_TDMA
subplot(3,1,2);
plot(frequence_MF_TDMA,fftshift(DSP_MF_TDMA));
xlabel("Frequence en Hz",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('DSP du signal MF\_TDMA','Interpreter','latex','FontSize',15);
title('Densite spectrale de puissance du signal MF\_TDMA','Interpreter','latex','FontSize',20)

% Affichage de la densité spectrale de puissance du signal MF_TDMA
subplot(3,1,3);
semilogy(frequence_MF_TDMA,fftshift(DSP_MF_TDMA));
xlabel("Frequence en Hz",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('DSP du signal MF\_TDMA','Interpreter','latex','FontSize',15);
title('Densite spectrale de puissance du signal MF\_TDMA en echelle log','Interpreter','latex','FontSize',20)

% Filtre passe-bas de type RIF permettant de récupérer le signal x1(t)
% Réponse impulsionnelle du filtre passe-bas
rep_imp_pb= 2*fc*Te*sinc(2*fc*[-N/2:1:N/2]*Te);


% Echelle temporelle
temps_pb = [0:Te:N*Te];


% Affichage de la réponse impulsionnelle du filtre passe_bas
figure('Name','Représentation de la réponse impulsionnelle et en fréquence du filtre passe-bas');
subplot(2,1,1);
plot(temps_pb,rep_imp_pb);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('rep\_imp\_pb','Interpreter','latex','FontSize',15);
title('Reponse impulsionnelle du filtre passe-bas','Interpreter','latex','FontSize',20)


% Echelle fréquence
frequence_pb = [-Fe/2:Fe/(length(rep_imp_pb)-1):Fe/2];


% Transformée de Fourier de la réponse impulsionnelle du filtre passe-bas
TF_rep_imp_pb = fft(rep_imp_pb);


% Affichage de la réponse en fréquence du filtre passe_bas
subplot(2,1,2);
plot(frequence_pb,fftshift(abs(TF_rep_imp_pb)));
xlabel("Frequence en Hz",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('TF\_rep\_imp\_pb','Interpreter','latex','FontSize',15);
title('Reponse en frequence du filtre passe-bas','Interpreter','latex','FontSize',20)


% Affichage de la densité spectrale de puissance du signal MF_TDMA et du
% module de la réponse en fréquence du filtre passe-bas
figure('Name','Représentation de la densité spectrale de puissance du signal MF_TDMA et du module de la réponse en fréquence du filtre passe-bas_bas');
plot(frequence_pb,fftshift((abs(TF_rep_imp_pb)/max(abs(TF_rep_imp_pb)))));
xlabel("Frequence en Hz",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
title('DSP du signal MF\_TDMA et du module de la reponse en frequence du filtre passe-bas','Interpreter','latex','FontSize',20);
hold on;
plot(frequence_MF_TDMA,fftshift(DSP_MF_TDMA/max(DSP_MF_TDMA)));
legend('abs(TF\_rep\_imp\_pb)','DSP\_MF\_TDMA','Interpreter','latex','FontSize',15);



% Filtre passe-haut de type RIF permettant de récupérer le signal x1(t)
% Réponse impulsiionnelle du filtre passe-haut

%Dir = dirac([-length(rep_imp_pb)/2:1:length(rep_imp_pb)/2-1]*Te);
%idx = Dir == Inf;
%Dir(idx) = 1;
Dir=zeros(1,N+1);
Dir(N/2+1)=1;
rep_imp_ph = Dir - rep_imp_pb;


% Affichage de la réponse impulsionnelle du filtre passe_haut
figure('Name','Représentation de la réponse impulsionnelle et en fréquence du filtre passe-haut');
subplot(2,1,1);
plot(temps_pb,rep_imp_ph);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('rep\_imp\_ph','Interpreter','latex','FontSize',15);
title('Reponse impulsionnelle du filtre passe-haut','Interpreter','latex','FontSize',20)


% Transformée de Fourier de la réponse impulsionnelle du filtre passe-bas
TF_rep_imp_ph = fft(rep_imp_ph);


% Affichage de la réponse en fréquence du filtre passe_haut
subplot(2,1,2);
plot(frequence_pb,fftshift(abs((TF_rep_imp_ph))));
xlabel("Frequence en Hz",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('TF\_rep\_imp\_ph','Interpreter','latex','FontSize',15);
title('Reponse en frequence du filtre passe-haut','Interpreter','latex','FontSize',20)


% Affichage de la densité spectrale de puissance du signal MF_TDMA et du
% module de la réponse en fréquence du filtre passe-haut
figure('Name','Représentation de la densité spectrale de puissance du signal MF_TDMA et du module de la réponse en fréquence du filtre passe-haut');
plot(frequence_pb,fftshift(abs(TF_rep_imp_ph)/max(abs(TF_rep_imp_ph))));
xlabel("Frequence en Hz",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
title('DSP du signal MF\_TDMA et du module de la reponse en frequence du filtre passe-haut','Interpreter','latex','FontSize',20);
hold on;
plot(frequence_MF_TDMA,fftshift(DSP_MF_TDMA/max(DSP_MF_TDMA)));
legend('abs(TF\_rep\_imp\_ph)','DSP\_MF\_TDMA','Interpreter','latex','FontSize',15);

% Retard
retard = zeros(1,N/2);

% Adapter le signal_MF_TDMA pour le filtrage
signal_MF_TDMA_modif = [signal_MF_TDMA retard];

% Filtrage de x1 et de x2 avec retard
x1_filtree_retard = filter(rep_imp_pb,1,signal_MF_TDMA_modif);
x2_filtree_retard = filter(rep_imp_ph,1,signal_MF_TDMA_modif);

% Filtrage de x1 et de x2 sans retard
x1_filtree = x1_filtree_retard(N/2+1:end);
x2_filtree = x2_filtree_retard(N/2+1:end);

% Affichage de x1 filtree
figure('Name','Représentation du signal MF_TDMA par le filtre passe-bas et passe-haut');
subplot(2,1,1);
plot(temps_signal,x1_filtree);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('x1\_filtree','Interpreter','latex','FontSize',15);
title('Signal MF\_TDMA par le filtre passe-bas','Interpreter','latex','FontSize',20);

% Affichage de x2 filtree
subplot(2,1,2);
plot(temps_signal,x2_filtree);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('x2\_filtree','Interpreter','latex','FontSize',15);
title('Signal MF\_TDMA par le filtre passe-haut','Interpreter','latex','FontSize',20)

% Retour en bande de base
msg1 = conv(x1_filtree.*cos(2*pi*Fp1*temps_signal),rep_imp_pb, 'same');
msg2 = conv(x2_filtree.*cos(2*pi*Fp2*temps_signal), rep_imp_pb, 'same');

% Affichage du tracé
figure('Name','Représentation du filtrage du message 1 et 2');
subplot(2,1,1);
plot(temps_signal,msg1);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
legend('msg1','Interpreter','latex','FontSize',15);
grid on;

subplot(2,1,2);
plot(temps_signal, msg2);
xlabel("Temps en secondes",'Interpreter','latex');
ylabel("Amplitude",'Interpreter','latex');
grid on;
legend('msg2','Interpreter','latex','FontSize',15);
title('Filtrage du message 1 et 2','Interpreter','latex','FontSize',20)

% Déctection du slot utile
trame = msg1 + msg2;
tranche1 = trame(1:length(m1));
tranche2 = trame(length(m1) +1 : 2*length(m1));
tranche3 = trame(2*length(m1) +1 : 3*length(m1));
tranche4 = trame(3*length(m1) +1 : 4*length(m1));
tranche5 = trame(4*length(m1) +1 : end);
energie1 = mean(abs(tranche1).^2)*length(tranche1);
energie2 = mean(abs(tranche2).^2)*length(tranche2);
energie3 = mean(abs(tranche3).^2)*length(tranche3);
energie4 = mean(abs(tranche4).^2)*length(tranche4);
energie5 = mean(abs(tranche5).^2)*length(tranche5);

tranche = [tranche1 ; tranche2; tranche3; tranche4; tranche5];
energie = [energie1; energie2; energie3; energie4; energie5];

% Définition du seuil et recherche des indices 
seuil = 10;
tranche_indice = find(energie>seuil);

% Démodulation bande de base
SignalFiltre = filter(ones(1,Ns),1,tranche(tranche_indice(1),:)) ;
SignalEchantillonne=SignalFiltre(Ns :Ns :end) ;
BitsRecuperes=(sign(SignalEchantillonne)+1)/2;

text1 = bin2str(BitsRecuperes);

SignalFiltre = filter(ones(1,Ns),1,tranche(tranche_indice(2),:)) ;
SignalEchantillonne=SignalFiltre(Ns :Ns :end) ;
BitsRecuperes=(sign(SignalEchantillonne)+1)/2;

text2 = bin2str(BitsRecuperes);