clear all;
close all;

% Paramètres du sujet
Fe = 24000; % Fréquence d'échantillonage en hz
Te = 1/Fe;  % 
Rb = 3000; % Débit binaire en bits par seconde

% Information binaire à transmettre
nb_bits = 1000;
bits = randi([0,1], 1, nb_bits);
%%                          Séquence 1


%---------------------------Modulateur 1----------------------------------
% Mapping binaire à moyenne nulle : 0->-1, 1->1
Symboles1 = 2*bits-1;
M1 = 2^1;
Rs1 = Rb / log2(M1);

% Durée symbole en nombre d'échantillons (Ts=NsTe)
Ts1 = 1/ Rs1;
Ns1 = Ts1 / Te;

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
a1 = kron(Symboles1, [1 zeros(1, Ns1-1)]);

% Génération de la réponse impulsionnelle du filtre de mise en forme
h1 = ones(1, Ns1);

% Filtrage de mise en forme
x1 = filter(h1,1,a1);

% Affichage du signal généré
figure('Name', 'Représentation temporelle du modulateur 1'); 
echelle_temps = linspace(0, nb_bits*Ts1, nb_bits*Ts1*Fe);
plot(echelle_temps, x1);
axis([0 nb_bits*Ts1 -1.5 1.5]);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');


% Calcul de la densité spectrale de puissance du signal 1
DSPx1 = pwelch(x1,[],[],[],Fe,'twosided');

% Calcul de la DSP théorique
echelle_freq = linspace(-Fe/2, Fe/2, length(DSPx1));
DSPx1_th = Ts1*(sinc(echelle_freq*Ts1)).^2 + Ts1*(sinc((echelle_freq-Fe)*Ts1)).^2;

% Affichage de la DSP du signal généré
figure('Name', 'Représentation fréquentielle de la DSP du modulateur 1');
semilogy(echelle_freq, fftshift(DSPx1));
grid on;
xlabel('Frequence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
figure('Name', 'DSP obtenu et théorique du modulateur 1');
semilogy(echelle_freq, fftshift(DSPx1));
hold on;
semilogy(echelle_freq, DSPx1_th);
grid on;
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
legend('DSP du modulateur 1', 'DSP th\''eorique','Interpreter','latex');


%--------------------------Modulateur 2------------------------------------
M2 = 2^2;
Rs2 = Rb / log2(M2);
Ts2 = 1/ Rs2;
Ns2 = Ts2 / Te;

% Mapping 4-aires à moyenne nulle: 00->-3, 01->-1, 10->1, 11->3
k = log2(M2); % Groupe de k bits
bits_reshape = reshape(bits, nb_bits/2, k);
bits_dec = bi2de(bits_reshape);
Symboles2 = bits_dec*2-3;

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
a2 = kron(transpose(Symboles2), [1 zeros(1, Ns2-1)]);

% Génération de la réponse impulsionnelle du filtre de mise en forme
h2 = ones(1, Ns2);

% Filtrage de mise en forme
x2 = filter(h2,1,a2);

% Affichage du signal généré
figure('Name', 'Représentation temporelle du modulateur 2'); 
echelle_temps = linspace(0, nb_bits*Ts2, nb_bits*Ts2*Fe/2);
plot(echelle_temps, x2);
grid on;
axis([0 nb_bits*Ts2 -3.5 3.5]);
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');


% Calcul de la densité spectrale de puissance du signal 2
DSPx2 = pwelch(x2,[],[],[],Fe,'twosided');

% Calcul de la DSP théorique
DSPx2_th = Ts2*(sinc(echelle_freq*Ts2)).^2 + Ts2*(sinc((echelle_freq-Fe)*Ts2)).^2;

% Affichage de la DSP du signal généré
figure('Name', 'Représentation fréquentielle de la DSP du modulateur 2');
plot(echelle_freq, fftshift(DSPx2));
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
figure('Name', 'DSP obtenu et théorique du modulateur 2');
semilogy(echelle_freq, fftshift(DSPx2));
hold on;
semilogy(echelle_freq, DSPx2_th);
grid on;
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
legend('DSP du modulateur 2', 'DSP th\''eorique','Interpreter','latex');


%---------------------------Modulateur 3-----------------------------------
% Mapping binaire à moyenne nulle : 0->-1, 1->1
Symboles3 = 2*bits-1;
M3 = 2^1;
Rs3 = Rb / log2(M3);

% Durée symbole en nombre d'échantillons (Ts=NsTe)
Ts3 = 1/ Rs3;
Ns3 = Ts3 / Te;

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
a3 = kron(Symboles3, [1 zeros(1, Ns3-1)]);

% Génération de la réponse impulsionnelle du filtre de mise en forme
alpha = rand(1);
%alpha = 0.3;
h3 = rcosdesign(alpha, Ns3, Ns3);

% Filtrage de mise en forme
x3 = filter(h3,1,a3);

% Affichage du signal généré
figure('Name', 'Représentation temporelle du modulateur 3'); 
echelle_temps = linspace(0, nb_bits*Ts3, nb_bits*Ts3*Fe);
plot(echelle_temps, x3);
grid on;
axis([0 nb_bits*Ts3 -1.5 1.5]);
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Calcul de la densité spectrale de puissance du signal 3
DSPx3 = pwelch(x3,[],[],[],Fe,'twosided');

% Calcul de la DSP théorique
moy_x3 = mean(Symboles3);
var_x3 = mean((Symboles3-moy_x3).^2);

DSPx3_th = zeros(1,length(DSPx3));
indice1 = find( abs(echelle_freq) <= (1-alpha)/(2*Ts3) );
indice2 = find(abs(echelle_freq) >= (1-alpha)/(2*Ts3) & abs(echelle_freq) <= (1+alpha)/(2*Ts3) );

DSPx3_th(indice1) = Ts3 ;
DSPx3_th(indice2) = (Ts3/2)*(1+cos(pi*Ts3/alpha*(abs(echelle_freq(indice2))-(1-alpha)/(2*Ts3) )));

% Affichage de la DSP du signal généré
figure('Name', 'Représentation fréquentielle de la DSP du modulateur 3');
plot(echelle_freq, fftshift(DSPx3));
grid on;
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
figure('Name', 'DSP obtenu et th\''eorique du modulateur 3');
semilogy(echelle_freq, fftshift(DSPx3));
hold on;
semilogy(echelle_freq, DSPx3_th);
grid on
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
legend('DSP du modulateur 3', 'DSP th\''eorique','Interpreter','latex');


% Comparaison des DSP des 3 modulateurs
figure('Name', 'Efficacité spectrale des 3 modulateurs'); 
semilogy(echelle_freq,fftshift(DSPx1));
hold on;
semilogy(echelle_freq, fftshift(DSPx2));
hold on;
semilogy(echelle_freq,fftshift(DSPx3));
grid on;
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
legend('Modulateur 1','Modulateur 2', 'Modulateur 3','Interpreter','latex');
%%                          Séquence 2 
%   Etude des interférences entre symbole et du critèere de Nyquist

%---------------------------Etude sans canal de propagation----------------
% Etude de l'impact du bruit, filtrage adapté, taux d'erreur 
% binaire, efficacité en puissance

% Reprise du mapping et filtre du modulateur 1 de la séquence 1
signal_e = x1;

% Filtre de réception
signal_f = filter(h1, 1, signal_e);

% Affichage du modulateur bande de base
figure('Name', 'Modulateur bande de base');
plot(echelle_temps, signal_f);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Réponse impulsionnelle du signal
g = conv(h1,h1);
g_plus=zeros(17,1);
g_plus(2:16)=g;
temps=[0:1:16];

figure('Name', 'Tracé de la réponse impulsionnelle globale sans canal');
plot(temps,g_plus);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Diagramme de l'oeil
figure('Name', "Diagramme de l'oeil");
plot(reshape(signal_f(Ns1+1:end),Ns1,length(signal_f(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Echantillonage pour n0=8
n0 = 8;
signal_echant1 = signal_f(n0:Ns1:end);
signal_echant1(find(signal_echant1 > 0))= 1;
signal_echant1(find(signal_echant1 <= 0))= -1;
TEB1 = length(find((signal_echant1 - Symboles1)~=0))/length(signal_echant1);

% Echantillonage pour n0=3
n0 = 3;
signal_echant2 = signal_f(n0:Ns1:end);
signal_echant2(find(signal_echant2 > 0))= 1;
signal_echant2(find(signal_echant2 <= 0))= 0;
TEB2 = length(find((signal_echant2 - Symboles1)~=0))/length(signal_echant2);


%---------------------------Etude avec canal de propagation----------------
% Cas 1 avec BW(ou fc) = 8000 Hz
BW = 8000; % fréquence de coupure en hertz
N = 101;
hc = (2*BW/Fe)*sinc(2*(BW/Fe)*[-(N-1)/2:(N-1)/2]);

% Réponse impulsionnelle globale
g1 = conv(conv(h1,hc), h1);
figure('Name', "Tracé de la réponse impulsionnelle globale avec canal");
plot(g1);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Canal de propagation
signal_glob_transitoire = conv(x1, hc, 'same');

% Filtre de réception
signal_glob = filter(h1,1,signal_glob_transitoire);
figure('Name', 'Filtre avec canal de propagation');
plot(signal_glob);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Diagramme de l'oeil
figure('Name', "Diagramme de l'oeil cas 1");
plot(reshape(signal_glob(Ns1+1:end),Ns1,length(signal_glob(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Calcul de  |H(f)*Hr(f)| et |Hc(f)|
Hc = fft(hc,length(hc));
hr = h1;
hhr = conv(h1,hr);
HHR = fft(hhr,length(Hc));
echelle_freq1 = linspace(-Fe/2, Fe/2, length(Hc));
echelle_freq2 = linspace(-Fe/2, Fe/2, length(HHR));


figure;
plot(echelle_freq1, fftshift(abs(Hc)/max(abs(Hc))));
hold on;
plot(echelle_freq2, fftshift(abs(HHR)/max(abs(HHR))));
grid on;
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
legend('|Hc(f)|','|H(f)*Hr(f)|');

% TEB
n0 = 8;
signal_glob_echant1 = signal_glob(n0:Ns1:end);
signal_glob_echant1(find(signal_glob_echant1 > 0))= 1;
signal_glob_echant1(find(signal_glob_echant1 <= 0))= -1;
TEB_glob = length(find((signal_glob_echant1 - Symboles1)~=0))/length(signal_glob_echant1);

% Cas 2 avec BW(ou fc) = 1000 Hz
BW = 1000; % fréquence de coupure en hertz
N = 101;
hc2 = (2*BW/Fe)*sinc(2*(BW/Fe)*[-(N-1)/2:(N-1)/2]);

% Réponse impulsionnelle globale
g2 = conv(conv(h1,hc2), h1);
figure('Name', "Tracé de la réponse impulsionnelle globale avec canal");
plot(g2);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Canal de propagation
signal_glob_transitoire2 = conv(x1, hc2, 'same');

% Filtre de réception
signal_glob2 = filter(h1,1,signal_glob_transitoire2);
figure('Name', 'Filtre avec canal de propagation');
plot(signal_glob2);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Diagramme de l'oeil
figure('Name', "Diagramme de l'oeil cas 2");
plot(reshape(signal_glob2(Ns1+1:end),Ns1,length(signal_glob2(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Calcul de  |H(f)*Hr(f)| et |Hc(f)|
Hc2 = fft(hc2,length(hc2));
hr2 = h1;
hhr2 = conv(h1,hr2);
HHR2 = fft(hhr2,length(Hc2));
echelle_freq12 = linspace(-Fe/2, Fe/2, length(Hc2));
echelle_freq22 = linspace(-Fe/2, Fe/2, length(HHR2));

figure;
plot(echelle_freq12, fftshift(abs(Hc2)/max(abs(Hc2))));
hold on;
plot(echelle_freq22, fftshift(abs(HHR2)/max(abs(HHR2))));
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
legend('|Hc(f)|','|H(f)*Hr(f)|');

% TEB
signal_glob_echant2 = signal_glob2(n0:Ns1:end);
signal_glob_echant2(find(signal_glob_echant2 > 0))= 1;
signal_glob_echant2(find(signal_glob_echant2 <= 0))= -1;
TEB_glob2 = length(find((signal_glob_echant2 - Symboles1)~=0))/length(signal_glob_echant2);

%%                          Séquence 3 

%---------------------------Chaine de référence----------------------------
Px = mean(abs(x1).^2);

% Ajout du bruit  avec Eb/N0 = 2
Eb_N0 = 10^(2/10);
sigma_carre = (Px*Ns1)/ (2*log2(M1)*Eb_N0);
sigma =  sqrt(sigma_carre);
bruit = sigma*randn(1,length(x1));
signal_bruitee = x1 + bruit;

% Filtre de réception
signal_bruitee_glob = filter(h1,1,signal_bruitee);

% Diagramme de l'oeil
figure('Name',"Trace de diagramme de l'oeil pour differentes valeurs de Eb/N0");
subplot(2,2,1);
plot(reshape(signal_bruitee_glob(Ns1+1:end), Ns1, length(signal_bruitee_glob(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
title("Diagramme de l'oeil d'un signal bruit\'e pour $\frac{Eb}{N_{0}}$ = 2",'Interpreter','latex');

% Ajout du bruit  avec Eb/N0 = 4
Eb_N0 = 10^(4/10);
sigma_carre = (Px*Ns1)/ (2*log2(M1)*Eb_N0);
sigma =  sqrt(sigma_carre);
bruit = sigma*randn(1,length(x1));
signal_bruitee = x1 + bruit;

% Filtre de réception
signal_bruitee_glob = filter(h1,1,signal_bruitee);

% Diagramme de l'oeil
subplot(2,2,2);
plot(reshape(signal_bruitee_glob(Ns1+1:end), Ns1, length(signal_bruitee_glob(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
title("Diagramme de l'oeil d'un signal bruit\'e pour $\frac{Eb}{N_{0}}$ = 4",'Interpreter','latex');

% Ajout du bruit  avec Eb/N0 = 6
Eb_N0 = 10^(6/10);
sigma_carre = (Px*Ns1)/ (2*log2(M1)*Eb_N0);
sigma =  sqrt(sigma_carre);
bruit = sigma*randn(1,length(x1));
signal_bruitee = x1 + bruit;

% Filtre de réception
signal_bruitee_glob = filter(h1,1,signal_bruitee);

% Diagramme de l'oeil
subplot(2,2,3);
plot(reshape(signal_bruitee_glob(Ns1+1:end), Ns1, length(signal_bruitee_glob(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
title("Diagramme de l'oeil d'un signal bruit\'e pour $\frac{Eb}{N_{0}}$ = 6",'Interpreter','latex');

% Ajout du bruit  avec Eb/N0 = 8
Eb_N0 = 10^(8/10);
sigma_carre = (Px*Ns1)/ (2*log2(M1)*Eb_N0);
sigma =  sqrt(sigma_carre);
bruit = sigma*randn(1,length(x1));
signal_bruitee = x1 + bruit;

% Filtre de réception
signal_bruitee_glob = filter(h1,1,signal_bruitee);

% Diagramme de l'oeil
subplot(2,2,4);
plot(reshape(signal_bruitee_glob(Ns1+1:end), Ns1, length(signal_bruitee_glob(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
title("Diagramme de l'oeil d'un signal bruit\'e pour $\frac{Eb}{N_{0}}$ = 8",'Interpreter','latex');


% TEB en fonction de Eb/No
TEB_dB_ref = zeros(1,9);
for i=1:9
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)

        % Ajout du bruit
        Eb_No_boucle = 10^((i-1)/10);
        sigma_carre_boucle = (Px*Ns1)/ (2*log2(M1)*Eb_No_boucle);
        sigma_boucle =  sqrt(sigma_carre_boucle);
        bruit_boucle = sigma_boucle*randn(1,length(x1));
        signal_bruitee_boucle = x1 + bruit_boucle;

        % Filtre de réception
        signal_bruitee_glob_boucle = filter(h1,1,signal_bruitee_boucle);

        % Echantillonnage
        signal_bruitee_glob_echant = signal_bruitee_glob_boucle(n0:Ns1:end);

        % Decision et demapping
        signal_bruitee_glob_echant(find(signal_bruitee_glob_echant > 0))= 1;
        signal_bruitee_glob_echant(find(signal_bruitee_glob_echant < 0))= -1;
        signal_bruitee_glob_echant = (signal_bruitee_glob_echant+1)/2;
        
        erreur = sum(abs(signal_bruitee_glob_echant - bits));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;
    end
    TEB_dB_ref(i) = nb_erreurs/compteur;
end

figure('Name', "Comparaison TEB simulee au TEB theorique de la chaine etudiee");
semilogy([1:9]-1,TEB_dB_ref);
hold on;

%TEB théorique
TEB_dB_th = zeros(1,9);
for i=1:9
    Eb_No_boucle = 10^((i-1)/10);
    TEB_dB_th(i) = qfunc(sqrt(2*Eb_No_boucle));
end
semilogy([1:9]-1, TEB_dB_th);
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB th\''eorique', 'Interpreter', 'latex');



%------------------------Première chaine à étudier-------------------------
hr= ones(1, Ns1);
hr((Ns1/2)+1:end) = 0;
f = conv(h1,hr);
f = [0 f(1:end-1)];
temps=[0:1:14];

figure('Name', "Tracé de la réponse impulsionnelle globale");
plot(temps, f);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Filtre de réception
chaine_ref = filter(hr,1, x1);
figure('Name', 'Filtre avec canal de propagation');
plot(chaine_ref);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Diagramme de l'oeil
figure('Name', "Diagramme de l'oeil en sortie du filtre de réception");
plot(reshape(chaine_ref(Ns1+1:end),Ns1,length(chaine_ref(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Ajout du bruit  avec Eb/N0 = 2
Px = mean(abs(x1).^2);
Eb_N0 = 10^(2/10);
sigma_carre = (Px*Ns1)/ (2*log2(M1)*Eb_N0);
sigma =  sqrt(sigma_carre);
bruit = sigma*randn(1,length(x1));
signal_bruitee = x1 + bruit;

% Filtre de réception
signal_bruitee_glob = filter(hr,1,signal_bruitee);

% Diagramme de l'oeil
figure('Name',"Trace de diagramme de l'oeil pour differentes valeurs de Eb/N0");
subplot(2,2,1);
plot(reshape(signal_bruitee_glob(Ns1+1:end), Ns1, length(signal_bruitee_glob(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
title("Diagramme de l'oeil d'un signal bruit\'e pour $\frac{Eb}{N_{0}}$ = 2",'Interpreter','latex');

% Ajout du bruit  avec Eb/N0 = 4
Eb_N0 = 10^(4/10);
sigma_carre = (Px*Ns1)/ (2*log2(M1)*Eb_N0);
sigma =  sqrt(sigma_carre);
bruit = sigma*randn(1,length(x1));
signal_bruitee = x1 + bruit;

% Filtre de réception
signal_bruitee_glob = filter(hr,1,signal_bruitee);

% Diagramme de l'oeil
subplot(2,2,2);
plot(reshape(signal_bruitee_glob(Ns1+1:end), Ns1, length(signal_bruitee_glob(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
title("Diagramme de l'oeil d'un signal bruit\'e pour $\frac{Eb}{N_{0}}$ = 4",'Interpreter','latex');

% Ajout du bruit  avec Eb/N0 = 6
Eb_N0 = 10^(6/10);
sigma_carre = (Px*Ns1)/ (2*log2(M1)*Eb_N0);
sigma =  sqrt(sigma_carre);
bruit = sigma*randn(1,length(x1));
signal_bruitee = x1 + bruit;

% Filtre de réception
signal_bruitee_glob = filter(hr,1,signal_bruitee);

% Diagramme de l'oeil
subplot(2,2,3);
plot(reshape(signal_bruitee_glob(Ns1+1:end), Ns1, length(signal_bruitee_glob(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
title("Diagramme de l'oeil d'un signal bruit\'e pour $\frac{Eb}{N_{0}}$ = 6",'Interpreter','latex');

% Ajout du bruit  avec Eb/N0 = 8
Eb_N0 = 10^(8/10);
sigma_carre = (Px*Ns1)/ (2*log2(M1)*Eb_N0);
sigma =  sqrt(sigma_carre);
bruit = sigma*randn(1,length(x1));
signal_bruitee = x1 + bruit;

% Filtre de réception
signal_bruitee_glob = filter(hr,1,signal_bruitee);

% Diagramme de l'oeil
subplot(2,2,4);
plot(reshape(signal_bruitee_glob(Ns1+1:end), Ns1, length(signal_bruitee_glob(Ns1+1:end))/Ns1));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
title("Diagramme de l'oeil d'un signal bruit\'e pour $\frac{Eb}{N_{0}}$ = 8",'Interpreter','latex');



% TEB en fonction de Eb/No
TEB_dB = zeros(1,9);
for i=1:9
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)

        % Ajout du bruit
        Eb_No_boucle = 10^((i-1)/10);   
        sigma_carre_boucle = (Px*Ns1)/ (2*log2(M1)*Eb_No_boucle);
        sigma_boucle =  sqrt(sigma_carre_boucle);
        bruit_boucle = sigma_boucle*randn(1,length(x1));
        signal_bruitee_boucle = x1 + bruit_boucle;

        % Filtre de réception
        signal_bruitee_glob_boucle = filter(hr,1,signal_bruitee_boucle);

        % Echantillonnage
        signal_bruitee_glob_echant = signal_bruitee_glob_boucle(n0:Ns1:end);

        % Decision et demapping
        signal_bruitee_glob_echant(find(signal_bruitee_glob_echant > 0))= 1;
        signal_bruitee_glob_echant(find(signal_bruitee_glob_echant < 0))= -1;
        signal_bruitee_glob_echant = (signal_bruitee_glob_echant+1)/2;
        
        erreur = sum(abs(signal_bruitee_glob_echant - bits));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;
    end
    TEB_dB(i) = nb_erreurs/compteur;
end

figure('Name', "Comparaison TEB simule au TEB theorique de la chaine etudiee");
semilogy([1:9]-1, TEB_dB);
hold on;
semilogy([1:9]-1, TEB_dB_th);
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB th\''eorique', 'Interpreter', 'latex');

figure('Name', "Comparaison TEB simule pour la chaine étudiée au TEB simule de la chaine ref");
semilogy([1:9]-1, TEB_dB);
hold on;
semilogy([1:9]-1, TEB_dB_ref);
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB chaine \''etudi\''ee','TEB chaine r\''ef''erence', 'Interpreter', 'latex');

%------------------------Deuxième chaine à étudier-------------------------
% Mapping
Symboles = (2*bi2de(reshape(bits,2,length(bits)/2).')-3).';

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
a_chaine2 = kron(Symboles, [1 zeros(1, Ns2-1)]);

% Filtrage de mise en forme et de réception
x_chaine2 = filter(h2,1,a_chaine2);
signal_chaine2 = filter(h2,1,x_chaine2);


% Diagramme de l'oeil
figure('Name', "Diagramme de l'oeil de la deuxième chaine");
plot(reshape(signal_chaine2(Ns2+1:end),Ns2,length(signal_chaine2(Ns2+1:end))/Ns2));
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Réponse impulsionnelle globale
g3 = conv(h2, h2);
g3 = [0 g3 0];
temps=[0:1:32];
figure('Name', "Tracé de la réponse impulsionnelle globale");
plot(temps, g3);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Implantation de la chaine sans bruit
n2 = 16;
g_to = Ns2;

% Echantillonage
signal_chaine2_echant = signal_chaine2(n2:Ns2:end);

% Décisions
decision = zeros(1,length(signal_chaine2_echant));
decision(find(signal_chaine2_echant >= 2*g_to)) = 3;
decision(find((signal_chaine2_echant <= 2*g_to) & (signal_chaine2_echant > 0))) = 1;
decision(find((signal_chaine2_echant > -2*g_to) & (signal_chaine2_echant <= 0))) = -1;
decision(find(signal_chaine2_echant <= -2*g_to)) = -3;

% Demapping
BitsDecides = reshape(de2bi((decision+3)/2).',1,length(bits));

% TEB de la deuxième chaine
TEB_chaine2 = length(find((bits - BitsDecides)~=0))/length(decision);

% TES
% TES en fonction de Eb/No
Px = mean(abs(x_chaine2).^2);
TES_dB = zeros(1,9);
for i=1:9
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)

        % Ajout du bruit
        Eb_No_boucle = 10^((i-1)/10);
        sigma_carre_boucle = (Px*Ns2)/ (2*log2(M2)*Eb_No_boucle);
        sigma_boucle =  sqrt(sigma_carre_boucle);
        bruit_boucle = sigma_boucle*randn(1,length(x_chaine2));
        signal_bruitee_boucle = x_chaine2 + bruit_boucle;

        % Filtre de réception
        signal_chaine2_boucle = filter(h2,1,signal_bruitee_boucle);
    
        % Echantillonage
        signal_chaine2_echant = signal_chaine2_boucle(n2:Ns2:end);

        % Décision
        decision_boucle = zeros(1,length(signal_chaine2_echant));
        decision_boucle(find(signal_chaine2_echant >= 2*g_to)) = 3;
        decision_boucle(find((signal_chaine2_echant <= 2*g_to) & (signal_chaine2_echant > 0))) = 1;
        decision_boucle(find((signal_chaine2_echant > -2*g_to) & (signal_chaine2_echant <= 0))) = -1;
        decision_boucle(find(signal_chaine2_echant <= -2*g_to)) = -3;
    
        % TES
        erreur = sum(abs(decision_boucle - Symboles));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;
    end
    TES_dB(i) = nb_erreurs/compteur;
end

figure('Name', "Comparaison TES simulee au TES theorique de la chaine etudiee");
semilogy(TES_dB);
hold on;


%TES théorique
TES_dB_th = zeros(1,9);
for i=1:9
    Eb_No_boucle = 10^((i-1)/10);
    TES_dB_th(i) = (3/2)*qfunc(sqrt((4/5)*Eb_No_boucle));
end
semilogy(TEB_dB_th);
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TES','Interpreter','latex');
legend('TES simul\''e','TES th\''eorique', 'Interpreter', 'latex');

% TEB en fonction de Eb/No
TEB_dB = zeros(1,9);
for i=1:9
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)

        % Ajout du bruit
        Eb_No_boucle = 10^((i-1)/10);
        sigma_carre_boucle = (Px*Ns2)/ (2*log2(M2)*Eb_No_boucle);
        sigma_boucle =  sqrt(sigma_carre_boucle);
        bruit_boucle = sigma_boucle*randn(1,length(x_chaine2));
        signal_bruitee_boucle = x_chaine2 + bruit_boucle;

        % Filtre de réception
        signal_chaine2_boucle = filter(h2,1,signal_bruitee_boucle);
        
        % Echantillonage
        signal_chaine2_echant = signal_chaine2_boucle(n2:Ns2:end);

        % Decision
        decision_boucle = zeros(1,length(signal_chaine2_echant));
        decision_boucle(find(signal_chaine2_echant >= 2*g_to)) = 3;
        decision_boucle(find((signal_chaine2_echant <= 2*g_to) & (signal_chaine2_echant > 0))) = 1;
        decision_boucle(find((signal_chaine2_echant > -2*g_to) & (signal_chaine2_echant <= 0))) = -1;
        decision_boucle(find(signal_chaine2_echant <= -2*g_to)) = -3;

        % Demapping
        BitsDecides_boucle = reshape(de2bi((decision_boucle+3)/2).',1,length(bits));

        erreur = sum(abs(BitsDecides_boucle - bits));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;
    end
    TEB_dB(i) = nb_erreurs/compteur;
end

%TEB théorique
TEB_dB_th = zeros(1,9);
for i=1:9
    Eb_No_boucle = 10^((i-1)/10);
    TEB_dB_th(i) = (3/4)*qfunc(sqrt((4/5)*Eb_No_boucle));
end

figure('Name', "Comparaison TEB simule au TEB théorique de la chaine etudiee");
semilogy(TEB_dB);
hold on;
semilogy(TEB_dB_th);
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB th\''eorique', 'Interpreter', 'latex');

figure('Name', "Comparaison TEB simule sur la chaine implantée au TEB de la chaine de reference")
semilogy(TEB_dB);
hold on;
semilogy(TEB_dB_ref);
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB de la chaine de r\''ef\''erence', 'Interpreter', 'latex');