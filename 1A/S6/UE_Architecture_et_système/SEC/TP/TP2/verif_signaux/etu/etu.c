#include <stdio.h>    /* entrées sorties */
#include <unistd.h>   /* pimitives de base : fork, ...*/
#include <stdlib.h>   /* exit */
#include <signal.h>   /* traitement des signaux */


/* Traitant du signal SIGRUS1 et SIGUSR2 */
void handler_sigrus(int signal_num) {
    printf("\nReception %d\n", signal_num) ;
    return ;
}

/* dormir pendant nb_secondes secondes  */
/* à utiliser à la palce de sleep(duree), car sleep s'arrête */
/* dès qu'un signal non ignoré est reçu */
void dormir(int nb_secondes)
{
    int duree = 0 ;
    while (duree < nb_secondes) {
        sleep(1) ;
        duree++ ;
    }
}

int main() {
    sigset_t ens_signaux1, ens_signaux2;

    /* associer traitant à SIGUSR1 */
    signal(SIGUSR1, handler_sigrus);
    /* associer traitant à SIGUSR2 */
    signal(SIGUSR2, handler_sigrus);

    /* masquer les signaux SIGINT et SIGUSR1 */
    sigemptyset(&ens_signaux1);
    sigemptyset(&ens_signaux2);
    sigaddset(&ens_signaux1, SIGINT);
    sigaddset(&ens_signaux2, SIGUSR1);

    /* se protéger des signaux masqués */
    sigprocmask(SIG_BLOCK, &ens_signaux1, NULL);
    sigprocmask(SIG_BLOCK, &ens_signaux2, NULL);

    /* envoie 2 SIGUSR1 */
    kill(getpid(), SIGUSR1);
    kill(getpid(), SIGUSR1);
    /* attente de 5s */
    dormir(5);
    /* envoie 2 SIGUSR2 */
    kill(getpid(), SIGUSR2);
    kill(getpid(), SIGUSR2);
    /* attente de 10s */
    dormir(10);

    /* démasquer SIGUSR1 */
    sigprocmask(SIG_UNBLOCK, &ens_signaux1, NULL);

    /* attente de 10s */
    dormir(10);

    /* démasquer SIGINT */
    sigprocmask(SIG_UNBLOCK, &ens_signaux2, NULL);

    printf("Salut");

    return EXIT_SUCCESS;
}
