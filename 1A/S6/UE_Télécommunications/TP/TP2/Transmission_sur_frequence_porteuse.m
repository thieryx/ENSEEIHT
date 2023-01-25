clear all;
close all;

% Paramètres du sujet
alpha = 0.35;
fp = 2000;
Fe = 10000;
Te = 1/Fe;
Rb = 2000;
M = 2^2;
Rs = Rb / log2(M);

% Durée symbole en nombre d'échantillons (Ts=NsTe)
Ts = 1/ Rs;
Ns = Ts / Te;

% Information binaire à transmettre
nb_bits = 12000;
bits = randi([0,1], 1, nb_bits);

%%         Chaine sur fréquence porteuse


% Mapping
%Symboles = bi2de(reshape(bits,2,length(bits)/2).','left-msb');
ak = zeros(1,length(bits)/2);
bk = zeros(1,length(bits)/2);
ak = bits(1:2:end);
bk = bits(2:2:end);
ak(find(ak == 0))= -1;
ak(find(ak == 1 ))= 1;
bk(find(bk == 0))= -1;
bk(find(bk == 1 ))= 1;

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
ak_sur = kron(ak, [1 zeros(1, Ns-1)]);
bk_sur = kron(bk, [1 zeros(1, Ns-1)]);
dk = ak + 1i*bk;

% Filtrage de mise en forme
h = rcosdesign(alpha, Ns, Ns);
I = filter(h,1,[ak_sur,zeros(1,Ns*Ns/2)]);
I = I(Ns*Ns/2 + 1: end);
Q = filter(h,1,[bk_sur,zeros(1,Ns*Ns/2)]);
Q = Q(Ns*Ns/2 + 1: end);

%t = linspace(0,500*Ts,length(Q));
t = (0:length(Q)-1)*Te;
x = I.*cos(2*pi*fp*t) - Q.*sin(2*pi*fp*t);
figure('Name', "I");
plot(I);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
figure('Name', "Q");
plot(Q);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');
figure('Name', "x");
plot(x);
grid on;
xlabel('Temps en seconde','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Calcul de la densité spectrale de puissance du signal
DSP = pwelch(x,[],[],[],Fe,'twosided');
echelle_freq = linspace(-Fe/2, Fe/2, length(DSP));
figure('Name', 'Représentation fréquentielle de la DSP du signal');
semilogy(echelle_freq, fftshift(DSP));
grid on;
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Retour en bande de base
x_retour = x.*cos(2*pi*fp*t)-1i*x.*sin(2*pi*fp*t);

% Démodulation bande de base
z = filter(h, 1, [x_retour,zeros(1,Ns*Ns/2)]);
z = z(Ns*Ns/2 + 1: end);

% Diagramme de l'oeil
figure('Name', "Diagramme de l'oeil");
plot(reshape(z(Ns+1:end),Ns,length(z(Ns+1:end))/Ns));
grid on;

% Echantillonage
signal_echant = z(1:Ns:length(z));

% Decision et demapping
signal_echant_ak = zeros(size(signal_echant));
signal_echant_bk = zeros(size(signal_echant));
signal_echant_ak(find(real(signal_echant) > 0))= 1;
signal_echant_ak(find(real(signal_echant) < 0))= 0;
signal_echant_bk(find(imag(signal_echant) > 0))= 1;
signal_echant_bk(find(imag(signal_echant) < 0))= 0;
bits_decides = zeros(1, nb_bits);
bits_decides(1:2:end) = signal_echant_ak;
bits_decides(2:2:end) = signal_echant_bk;

% TEB
TEB = length(find(bits_decides - bits)~=0)/length(bits);

% Ajout du bruit
Px = mean(abs(x).^2);

% TEB en fonction de Eb/No
TEB_dB = zeros(1,7);
signal_echant_ak_boucle = zeros(size(signal_echant));
signal_echant_bk_boucle = zeros(size(signal_echant));
for i=1:7
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)

        % Ajout du bruit
        Eb_No_boucle = 10^((i-1)/10);
        sigma_carre_boucle = (Px*Ns)/ (2*log2(M)*Eb_No_boucle);
        sigma_boucle =  sqrt(sigma_carre_boucle);
        bruit_boucle = sigma_boucle*randn(1,length(x));
        signal_bruitee_boucle = x + bruit_boucle;
        
        % Retour en bande de base
        x_retour = signal_bruitee_boucle.*cos(2*pi*fp*t)-1i*signal_bruitee_boucle.*sin(2*pi*fp*t);

        % Filtre de réception
        signal_bruitee_glob_boucle = filter(h,1,[x_retour,zeros(1,Ns*Ns/2)]);
        signal_bruitee_glob_boucle = signal_bruitee_glob_boucle(Ns*Ns/2 + 1: end);
        
        % Echantillonage
        signal_echant_boucle = signal_bruitee_glob_boucle(1:Ns:length(signal_bruitee_glob_boucle));
        
        % Décision et demapping
        signal_echant_ak_boucle(find(real(signal_echant_boucle) > 0))= 1;
        signal_echant_ak_boucle(find(real(signal_echant_boucle) < 0))= 0;
        signal_echant_bk_boucle(find(imag(signal_echant_boucle) > 0))= 1;
        signal_echant_bk_boucle(find(imag(signal_echant_boucle) < 0))= 0;
        bits_decides_boucle = zeros(1, nb_bits);
        bits_decides_boucle(1:2:end) = signal_echant_ak_boucle;
        bits_decides_boucle(2:2:end) = signal_echant_bk_boucle;

        erreur = sum(abs(bits_decides_boucle - bits));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;

    end
    TEB_dB(i) = nb_erreurs/compteur;
end

%TEB théorique
TEB_dB_th = zeros(1,7);
for i=1:7
    Eb_No_boucle = 10^((i-1)/10);
    TEB_dB_th(i) = qfunc(sqrt(2*Eb_No_boucle));

end

% Comparaison du TEB simule et theorique
figure('Name', "Comparaison TEB simule au TEB théorique de la chaine etudiee");
semilogy([1:7]-1,TEB_dB);
hold on;
semilogy([1:7]-1,TEB_dB_th);
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB th\''eorique', 'Interpreter', 'latex');

%--------------------------Chaine passe-bas équivalente-------------------
xe = I+ 1i*Q;

% Calcul de la densité spectrale de puissance du signal
DSP = pwelch(xe,[],[],[],Fe,'twosided');
echelle_freq = linspace(-Fe/2, Fe/2, length(DSP));
figure('Name', 'Représentation fréquentielle de la DSP du signal');
semilogy(echelle_freq, fftshift(DSP));
grid on;
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel('Amplitude en volt','Interpreter','latex');

% Diagramme de l'oeil
figure('Name', "Diagramme de l'oeil");
plot(reshape(xe(Ns+1:end),Ns,length(xe(Ns+1:end))/Ns));
grid on;

% Démodulation bande de base
z = filter(h, 1, [xe,zeros(1,Ns*Ns/2)]);
z = z(Ns*Ns/2 + 1: end);

% Echantillonage
signal_echant_bas = z(1:Ns:length(z));

% Décision et démapping
signal_echant_ak_bas = zeros(size(signal_echant_bas));
signal_echant_bk_bas = zeros(size(signal_echant_bas));
signal_echant_ak_bas(find(real(signal_echant_bas) > 0))= 1;
signal_echant_ak_bas(find(real(signal_echant_bas) < 0))= 0;
signal_echant_bk_bas(find(imag(signal_echant_bas) > 0))= 1;
signal_echant_bk_bas(find(imag(signal_echant_bas) < 0))= 0;
bits_decides = zeros(1, nb_bits);
bits_decides(1:2:end) = signal_echant_ak_bas;
bits_decides(2:2:end) = signal_echant_bk_bas;

% TEB
TEB_bas = length(find(bits_decides - bits)~=0)/length(bits);

% Ajout du bruit
Px = mean(abs(xe).^2);

% TEB en fonction de Eb/No
TEB_dB_bas = zeros(1,7);
signal_echant_ak_boucle = zeros(size(signal_echant_bas));
signal_echant_bk_boucle = zeros(size(signal_echant_bas));
for i=1:7
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)

        % Ajout du bruit
        Eb_No_boucle = 10^((i-1)/10);
        sigma_carre_boucle = (Px*Ns)/ (2*log2(M)*Eb_No_boucle);
        sigma_boucle =  sqrt(sigma_carre_boucle);
        bruit_boucle_I = sigma_boucle*randn(1,length(xe));
        bruit_boucle_Q = sigma_boucle*randn(1,length(xe));
        bruit_boucle = bruit_boucle_I + 1i*bruit_boucle_Q;
        signal_bruitee_boucle = xe + bruit_boucle;
        
        % Filtre de réception
        signal_bruitee_glob_boucle = filter(h,1,[signal_bruitee_boucle,zeros(1,Ns*Ns/2)]);
        signal_bruitee_glob_boucle = signal_bruitee_glob_boucle(Ns*Ns/2 + 1: end);
        
        % Echantillonage
        signal_echant_boucle = signal_bruitee_glob_boucle(1:Ns:length(signal_bruitee_glob_boucle));
        
        % Décision et démapping
        signal_echant_ak_boucle(find(real(signal_echant_boucle) > 0))= 1;
        signal_echant_ak_boucle(find(real(signal_echant_boucle) < 0))= 0;
        signal_echant_bk_boucle(find(imag(signal_echant_boucle) > 0))= 1;
        signal_echant_bk_boucle(find(imag(signal_echant_boucle) < 0))= 0;
        bits_decides_boucle = zeros(1, nb_bits);
        bits_decides_boucle(1:2:end) = signal_echant_ak_boucle;
        bits_decides_boucle(2:2:end) = signal_echant_bk_boucle;

        erreur = sum(abs(bits_decides_boucle - bits));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;

    end
    TEB_dB_bas(i) = nb_erreurs/compteur;

    % Constellation en sortie de l'échantillonneur
    if (i == 1 || i == 3 || i == 5 || i == 7)
        plot(signal_echant_boucle);
        nom = strcat("Constellations en sortie de l'échantillonneur avec Eb/N0 = ",num2str(i-1),"dB");
        title(nom);
        xlim([-2 2]);
        ylim([-2 2]);
    end
end

% Comparaison du TEB simule et theorique
figure('Name', "TEB de la chaine passe-bas équivalente");
semilogy([1:7]-1,TEB_dB_bas);
hold on;
semilogy([1:7]-1,TEB_dB);
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB th\''eorique', 'Interpreter', 'latex');

% Constellations
figure('Name',"Constellation en sortie du mapping");
plot(ak,bk,'o');
grid on;
xlabel("ak", 'Interpreter', 'latex');
ylabel("bk",'Interpreter','latex');

% rajout du bruit  avec EbNo = 0
retard = Ns*Ns/2;
EbN0 = 10^(0/10);
sigma = sqrt(Px*Ns/(2*EbN0));
bruitI = sigma*randn(1, length(xe));
bruitQ = sigma*randn(1, length(xe));
x = xe + bruitI + 1i*bruitQ;
x_reception = filter(h,1,[x zeros(1,retard)]);
x_recep = x_reception(retard +1 :end);
x_recup = x_recep(1:Ns:end);
ak = real(x_recup);
bk= imag(x_recup);

% Constellations
subplot(221);
plot(ak,bk,"r*");
grid on;
xlabel("ak", 'Interpreter', 'latex');
ylabel("bk",'Interpreter','latex');
title("Constellations pour Eb/N0 = 0",'Interpreter','latex');

% rajout du bruit  avec EbNo = 2
retard = Ns*Ns/2;
EbN0 = 10^(2/10);
sigma = sqrt(Px*Ns/(2*EbN0));
bruitI = sigma*randn(1, length(xe));
bruitQ = sigma*randn(1, length(xe));
x = xe + bruitI + 1i*bruitQ;
x_reception = filter(h,1,[x zeros(1,retard)]);
x_recep = x_reception(retard +1 :end);
x_recup = x_recep(1:Ns:end);
ak = real(x_recup);
bk= imag(x_recup);

% Constellations
subplot(222);
plot(ak,bk,"r*")
xlabel("ak", 'Interpreter', 'latex');
ylabel("bk",'Interpreter','latex');
title("Constellations pour Eb/N0 = 2",'Interpreter','latex');

%rajout du bruit  avec EbNo = 4

EbN0 = 10^(4/10);
sigma = sqrt(Px*Ns/(2*EbN0));
bruitI = sigma*randn(1, length(xe));
bruitQ = sigma*randn(1, length(xe));
x = xe + bruitI + 1i*bruitQ;
x_reception = filter(h,1,[x zeros(1,retard)]);
x_recep = x_reception(retard +1 :end);
x_recup = x_recep(1:Ns:end);
ak = real(x_recup);
bk= imag(x_recup);

% Constellations
subplot(223);
plot(ak,bk,"r*");
xlabel("ak", 'Interpreter', 'latex');
ylabel("bk",'Interpreter','latex');
title("Constellations pour Eb/N0 = 4",'Interpreter','latex');

%rajout du bruit  avec EbNo = 6

EbN0 = 10^(6/10);
sigma = sqrt(Px*Ns/(2*EbN0));
bruitI = sigma*randn(1, length(xe));
bruitQ = sigma*randn(1, length(xe));
x = xe + bruitI + 1i*bruitQ;
x_reception = filter(h,1,[x zeros(1,retard)]);
x_recep = x_reception(retard +1 :end);
x_recup = x_recep(1:Ns:end);
ak = real(x_recup);
bk= imag(x_recup);

% Constellations

subplot(224);
plot(ak,bk,"r*")
xlabel("ak", 'Interpreter', 'latex');
ylabel("bk",'Interpreter','latex');
title("Constellations pour Eb/N0 = 6",'Interpreter','latex');




%%         Comparaison de modulations sur fréquence porteuse

% Déclaration des variables
Rb = 48000;
alpha = 0.5;
Ns = 4;

%% Implantation de la chaine complète sans bruit
%% Modulation 4-ASK
M_4ask= 4;
N_4ask = log2(M_4ask);

% Mapping
Symboles_4ask = (2*bi2de(reshape(bits,N_4ask,length(bits)/N_4ask).')-3).';

% Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
d_4ask = kron(Symboles_4ask, [1 zeros(1, Ns-1)]);

% Filtre de mise en forme
h = rcosdesign(alpha,Ns,Ns,'sqrt');
x_4ask = filter(h, 1, [d_4ask, zeros(1, Ns*Ns/2)]);
x_4ask = x_4ask((Ns*Ns/2)+1: end);

% Filtre de réception
z_4ask = filter(h, 1, [x_4ask zeros(1,Ns*Ns/2)]);
z_4ask = z_4ask((Ns*Ns/2)+1:end);

% Echantillonnage
zm_4ask = z_4ask(1:Ns:end);

% Decision et demapping
dm_4ask = zeros(1,length(zm_4ask));
dm_4ask(find(zm_4ask > 2)) = 3;
dm_4ask(find((zm_4ask <= 2) & (zm_4ask >= 0))) = 1;
dm_4ask(find((zm_4ask >= -2) & (zm_4ask < 0))) = -1;
dm_4ask(find(zm_4ask < -2)) = -3;
dm_final_4ask = reshape(de2bi((dm_4ask + 3)/2).',1,length(bits));

% TEB
TEB_4ask = sum(abs(dm_final_4ask-bits));
   
% Les constellations en sortie du mapping
scatterplot(Symboles_4ask);
title("Constellations du modulateur 4-ASK");
xlim([-6 6]);
ylim([-6 6]);

%% Modulation QPSK
M_qpsk= 4;
N_qpsk = log2(M_qpsk);

% Mapping
Symboles_qpsk = bi2de(reshape(bits,length(bits)/N_qpsk, N_qpsk)).';
x_qpsk = pskmod(Symboles_qpsk, M_qpsk, pi/4, 'gray');

% Decision et Demapping
z_qpsk = pskdemod(x_qpsk, M_qpsk, pi/4, 'gray');
dm_qpsk = de2bi(z_qpsk.');
dm_qpsk = dm_qpsk(:)';

% TEB
TEB_qpsk = sum(abs(dm_qpsk-bits));
   
% Les constellations en sortie du mapping
scatterplot(x_qpsk);
title("Constellations du modulateur QPSK");
xlim([-2 2]);
ylim([-2 2]);

%% Modulation 8-PSK
M_8psk= 8;
N_8psk = log2(M_8psk);

% Mapping
Symboles_8psk = bi2de(reshape(bits,length(bits)/N_8psk, N_8psk)).';
x_8psk = pskmod(Symboles_8psk, M_8psk, pi/8, 'gray');

% Decision et Demapping
z_8psk = pskdemod(x_8psk, M_8psk, pi/8, 'gray');
dm_8psk = de2bi(z_8psk.');
dm_8psk = dm_8psk(:)';

% TEB
TEB_8psk = sum(abs(dm_8psk-bits));
   
% Les constellations en sortie du mapping
scatterplot(x_8psk);
title("Constellations du modulateur 8-PSK");
xlim([-2 2]);
ylim([-2 2]);

%% Modulation 16-QAM
M_16qam= 16;
N_16qam = log2(M_16qam);

% Mapping
Symboles_16qam = bi2de(reshape(bits,length(bits)/N_16qam, N_16qam)).';
x_16qam = qammod(Symboles_16qam, M_16qam, 'gray');

% Decision et Demapping
z_16qam = qamdemod(x_16qam, M_16qam, 'gray');
dm_16qam = de2bi(z_16qam.');
dm_16qam = dm_16qam(:)';

% TEB
TEB_16qam = sum(abs(dm_16qam-bits));
   
% Les constellations en sortie du mapping
scatterplot(x_16qam);
title("Constellations du modulateur 16-QAM");
xlim([-5 5]);
ylim([-5 5]);

%% Implantation de la chaine complète avec bruit
%% Modulateur 4-ASK
Eb_No = zeros(1,7);
TEB_dB_4ask = zeros(1,7);
for i=1:7
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)
    
        % Ajout du bruit
        Px_4ask = mean(abs(x_4ask).^2);
        Eb_No(i) = 10^((i-1)/10);   
        sigma_4ask = sqrt((Px_4ask*Ns)/ (2*log2(M_4ask)*Eb_No(i)));
        bruit_4ask = sigma_4ask*randn(1,length(x_4ask));
        x_4ask_bruit = x_4ask + bruit_4ask;

        % Filtre de réception
        z_4ask_bruit = filter(h, 1, [x_4ask_bruit, zeros(1, Ns*Ns/2)]);
        z_4ask_bruit = z_4ask_bruit((Ns*Ns/2)+1:end);

        % Echantillonnage
        zm_4ask_bruit = z_4ask_bruit(1:Ns:end);

        % Decision et demapping
        dm_4ask_bruit = zeros(1,length(zm_4ask_bruit));
        dm_4ask_bruit(find(zm_4ask_bruit > 2)) = 3;
        dm_4ask_bruit(find((zm_4ask_bruit <= 2) & (zm_4ask_bruit >= 0))) = 1;
        dm_4ask_bruit(find((zm_4ask_bruit >= -2) & (zm_4ask_bruit < 0))) = -1;
        dm_4ask_bruit(find(zm_4ask_bruit < -2)) = -3;
        dm_final_4ask_bruit = reshape(de2bi((dm_4ask_bruit + 3)/2).',1,nb_bits);   
        
        % TEB
        erreur = sum(abs(dm_final_4ask_bruit - bits));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;
    end
    TEB_dB_4ask(i) = nb_erreurs/compteur;

    % Constellation en sortie de l'échantillonneur
    if (i == 1 || i == 3 || i == 5 || i == 7)
        scatterplot(zm_4ask_bruit);
        nom = strcat("Constellations 4-ASK en sortie de l'échantillonneur avec Eb/N0 = ",num2str(i-1),"dB");
        title(nom);
        xlim([-6 6]);
        ylim([-6 6]);
    end
end

% TEB
figure('Name', "TEB du modulateur 4-ASK");
semilogy([0:6], TEB_dB_4ask);
hold on;
semilogy([0:6], (3/4)*qfunc(sqrt((12/15)*Eb_No)));
hold on;
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB th\''eorique', 'Interpreter', 'latex');

%% Modulateur QPSK
Eb_No = zeros(1,7);
TEB_dB_qpsk = zeros(1,7);
for i=1:7
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)
        
        % Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
        d_qpsk = kron(x_qpsk, [1 zeros(1, Ns-1)]);

        % Filtre de mise en forme
        xe_qpsk = filter(h, 1, [d_qpsk, zeros(1, Ns*Ns/2)]);
        xe_qpsk = xe_qpsk((Ns*Ns/2)+1: end);

        % Ajout du bruit
        Px_qpsk = mean(abs(xe_qpsk).^2);
        Eb_No(i) = 10^((i-1)/10);   
        sigma_qpsk = sqrt((Px_qpsk*Ns)/ (2*log2(M_qpsk)*Eb_No(i)));
        bruit_qpsk_reel = sigma_qpsk*randn(1,length(real(xe_qpsk)));
        bruit_qpsk_imaginaire = sigma_qpsk*randn(1,length(imag(xe_qpsk)));
        xe_qpsk_bruit = xe_qpsk + bruit_qpsk_reel + 1i*bruit_qpsk_imaginaire;

        % Filtre de réception
        z_qpsk_bruit = filter(h, 1, [xe_qpsk_bruit, zeros(1, Ns*Ns/2)]);
        z_qpsk_bruit = z_qpsk_bruit((Ns*Ns/2)+1:end);
        
        % Echantillonnage
        zm_qpsk_bruit = z_qpsk_bruit(1:Ns:end);

        % Decision et demapping
        dm_qpsk_bruit = pskdemod(zm_qpsk_bruit, M_qpsk, pi/M_qpsk, 'gray'); 
        dm_final_qpsk_bruit = de2bi(dm_qpsk_bruit.');
        dm_final_qpsk_bruit = dm_final_qpsk_bruit(:)';

        % TEB
        erreur = sum(abs(dm_final_qpsk_bruit - bits));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;
    end
    TEB_dB_qpsk(i) = nb_erreurs/compteur;

    % Constellation en sortie de l'échantillonneur
    if (i == 1 || i == 3 || i == 5 || i == 7)
        scatterplot(zm_qpsk_bruit);
        nom = strcat("Constellations QPSK en sortie de l'échantillonneur avec Eb/N0 = ",num2str(i-1),"dB");
        title(nom);
        xlim([-2 2]);
        ylim([-2 2]);
    end
end

% TEB
figure('Name', "TEB du modulateur QPSK");
semilogy([0:6], TEB_dB_qpsk);
hold on;
semilogy([0:6], qfunc(sqrt(2*Eb_No)));
hold on;
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB th\''eorique', 'Interpreter', 'latex');

%% Modulateur 8-PSK
Eb_No = zeros(1,7);
TEB_dB_8psk = zeros(1,7);
for i=1:7
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)
        
        % Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
        d_8psk = kron(x_8psk, [1 zeros(1, Ns-1)]);

        % Filtre de mise en forme
        xe_8psk = filter(h, 1, [d_8psk, zeros(1, Ns*Ns/2)]);
        xe_8psk = xe_8psk((Ns*Ns/2)+1: end);

        % Ajout du bruit
        Px_8psk = mean(abs(xe_8psk).^2);
        Eb_No(i) = 10^((i-1)/10);   
        sigma_8psk = sqrt((Px_8psk*Ns)/ (2*log2(M_8psk)*Eb_No(i)));
        bruit_8psk_reel = sigma_8psk*randn(1,length(real(xe_8psk)));
        bruit_8psk_imaginaire = sigma_8psk*randn(1,length(imag(xe_8psk)));
        xe_8psk_bruit = xe_8psk + bruit_8psk_reel + 1i*bruit_8psk_imaginaire;

        % Filtre de réception
        z_8psk_bruit = filter(h, 1, [xe_8psk_bruit, zeros(1, Ns*Ns/2)]);
        z_8psk_bruit = z_8psk_bruit((Ns*Ns/2)+1:end);
        
        % Echantillonnage
        zm_8psk_bruit = z_8psk_bruit(1:Ns:end);

        % Decision et demapping
        dm_8psk_bruit = pskdemod(zm_8psk_bruit, M_8psk, pi/M_8psk, 'gray'); 
        dm_final_8psk_bruit = de2bi(dm_8psk_bruit.');
        dm_final_8psk_bruit = dm_final_8psk_bruit(:)';

        % TEB
        erreur = sum(abs(dm_final_8psk_bruit - bits));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;
    end
    TEB_dB_8psk(i) = nb_erreurs/compteur;

    % Constellation en sortie de l'échantillonneur
    if (i == 1 || i == 3 || i == 5 || i == 7)
        scatterplot(zm_8psk_bruit);
        nom = strcat("Constellations 8-PSK en sortie de l'échantillonneur avec Eb/N0 = ",num2str(i-1),"dB");
        title(nom);
        xlim([-2 2]);
        ylim([-2 2]);
    end
end

% TEB
figure('Name', "TEB du modulateur 8-PSK");
semilogy([0:6], TEB_dB_8psk);
hold on;
semilogy([0:6], (2/3)*qfunc(sqrt(2*Eb_No*sin(pi/M_8psk))));
hold on;
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB th\''eorique', 'Interpreter', 'latex');

%% Modulateur 16-QAM
Eb_No = zeros(1,7);
TEB_dB_16qam = zeros(1,7);
for i=1:7
    nb_erreurs = 0;
    compteur = 0;
    while (nb_erreurs<100)
        
        % Génération de la suite de Diracs pondérés par les symbols (suréchantillonnage)
        d_16qam = kron(x_16qam, [1 zeros(1, Ns-1)]);

        % Filtre de mise en forme
        xe_16qam = filter(h, 1, [d_16qam, zeros(1, Ns*Ns/2)]);
        xe_16qam = xe_16qam((Ns*Ns/2)+1: end);

        % Ajout du bruit
        Px_16qam = mean(abs(xe_16qam).^2);
        Eb_No(i) = 10^((i-1)/10);   
        sigma_16qam = sqrt((Px_16qam*Ns)/ (2*log2(M_16qam)*Eb_No(i)));
        bruit_16qam_reel = sigma_16qam*randn(1,length(real(xe_16qam)));
        bruit_16qam_imaginaire = sigma_16qam*randn(1,length(imag(xe_16qam)));
        xe_16qam_bruit = xe_16qam + bruit_16qam_reel + 1i*bruit_16qam_imaginaire;

        % Filtre de réception
        z_16qam_bruit = filter(h, 1, [xe_16qam_bruit, zeros(1, Ns*Ns/2)]);
        z_16qam_bruit = z_16qam_bruit((Ns*Ns/2)+1:end);
        
        % Echantillonnage
        zm_16qam_bruit = z_16qam_bruit(1:Ns:end);

        % Decision et demapping
        dm_16qam_bruit = qamdemod(zm_16qam_bruit, M_16qam, 'gray'); 
        dm_final_16qam_bruit = de2bi(dm_16qam_bruit.');
        dm_final_16qam_bruit = dm_final_16qam_bruit(:)';

        % TEB
        erreur = sum(abs(dm_final_16qam_bruit - bits));
        nb_erreurs = nb_erreurs + erreur;
        compteur = compteur + nb_bits;
    end
    TEB_dB_16qam(i) = nb_erreurs/compteur;

    % Constellation en sortie de l'échantillonneur
    if (i == 1 || i == 3 || i == 5 || i == 7)
        scatterplot(zm_16qam_bruit);
        nom = strcat("Constellations 16-QAM en sortie de l'échantillonneur avec Eb/N0 = ",num2str(i-1),"dB");
        title(nom);
        xlim([-5 5]);
        ylim([-5 5]);
    end
end

% TEB
figure('Name', "TEB du modulateur 16-QAM");
semilogy([0:6], TEB_dB_16qam);
hold on;
semilogy([0:6], (3/4)*qfunc(sqrt((12/15)*Eb_No)));
hold on;
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend('TEB simul\''e','TEB th\''eorique', 'Interpreter', 'latex');

%% Comparaison des TEB

figure("Name", "Comparaison des TEB simulés des différentes chaines");
semilogy([0:6], TEB_dB_4ask);
hold on;
semilogy([0:6], TEB_dB_qpsk);
hold on;
semilogy([0:6], TEB_dB_8psk);
hold on;
semilogy([0:6], TEB_dB_16qam);
hold on;
grid on;
xlabel("$\frac{Eb}{N_{0}}$ (dB)", 'Interpreter', 'latex');
ylabel('TEB','Interpreter','latex');
legend("Modulateur 4-ASK", "Modulateur QPSK", "Modulateur 8-PSK", "Modulateur 16-QAM", 'Interpreter', 'latex');

%% Comparaison des DSP

DSP_4ask = abs(fft(x_4ask)).^2;
DSP_qpsk = abs(fft(xe_qpsk)).^2;
DSP_8psk = abs(fft(xe_8psk)).^2;
DSP_16qam = abs(fft(xe_16qam)).^2;
echelle_freq_4ask = [-(Fe/2):Fe/length(DSP_4ask):(Fe/2)-(Fe/length(DSP_4ask))];
echelle_freq_qpsk = [-(Fe/2):Fe/length(DSP_qpsk):(Fe/2)-(Fe/length(DSP_qpsk))];
echelle_freq_8psk = [-(Fe/2):Fe/length(DSP_8psk):(Fe/2)-(Fe/length(DSP_8psk))];
echelle_freq_16qam = [-(Fe/2):Fe/length(DSP_16qam):(Fe/2)-(Fe/length(DSP_16qam))];

figure("Name", "Comparaison des DSP des différentes chaines");
semilogy(echelle_freq_4ask,fftshift(DSP_4ask));
hold on;
semilogy(echelle_freq_qpsk,fftshift(DSP_qpsk));
hold on;
semilogy(echelle_freq_8psk,fftshift(DSP_8psk));
hold on;
semilogy(echelle_freq_16qam,fftshift(DSP_16qam));
hold on;
xlabel('Fr\''equence en hertz','Interpreter','latex');
ylabel("DSP",'Interpreter','latex');
legend("Modulateur 4-ASK", "Modulateur QPSK", "Modulateur 8-PSK", "Modulateur 16-QAM", 'Interpreter', 'latex');