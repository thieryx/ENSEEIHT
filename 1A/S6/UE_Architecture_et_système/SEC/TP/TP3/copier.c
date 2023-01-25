#include <stdio.h>    /* entrées sorties */
#include <unistd.h>   /* pimitives de base : fork, ...*/
#include <stdlib.h>   /* exit */
#include <sys/wait.h> /* wait */
#include <sys/types.h>
#include <string.h>   /* opérations sur les chaines */
#include <fcntl.h>    /* opérations sur les fichiers */

void erreur(pid_t pidFils) {
    printf("\n     Processus fils numero %d : ERREUR EXEC\n", pidFils) ;
    /* perror : affiche un message relatif à l'erreur du dernier appel systàme */
    perror("     exec ") ;
    exit(pidFils) ;   /* sortie avec le numéro di fils qui a échoué */
}

int main(int argc, char *argv[])
{   
    int retour, fils_termine, wstatus ;
    int desc_fic_source, desc_fic_destination;
    int BUFSIZE = 32;
    char tmp[BUFSIZE] ;     /* buffer de lecture */

    /* Initialiser buffer avec 0 */
    bzero(tmp, sizeof(tmp)) ;

    /* ouverture du fichier en lecture */
    desc_fic_source = open(argv[1], O_RDONLY);
    desc_fic_destination = open(argv[2], O_WRONLY);

    /* traiter systématiquement les retours d'erreur des appels */
    if (desc_fic_source < 0) {
        printf("Erreur ouverture %s\n", argv[1]) ;
        exit(1) ;
    }

    printf("\nJe suis le processus principal de pid %d\n", getpid()) ;

    retour = fork() ;

    /* Bonne pratique : tester systématiquement le retour des appels système */
    if (retour < 0) {   /* échec du fork */
        printf("Erreur fork\n") ;
        /* Convention : s'arrêter avec une valeur > 0 en cas d'erreur */
        exit(1) ;
    }

    /* fils */
    if (retour == 0) {

       /* lire le fichier par blocs de 32 octets */
       while (read(desc_fic_source, tmp, 32) > 0) {
            printf("     Processus fils a lu %s\n", tmp) ;
            write(desc_fic_destination, tmp, 32);

           }
           /* Important : terminer un processus par exit */
           exit(EXIT_SUCCESS) ;   /* Terminaison normale (0 = sans erreur) */
       }

       /* pere */
       else {
           printf("\nProcessus de pid %d a cree un fils, de pid %d \n",getpid(), retour) ;
       }
    

    /* attendre la fin d'un fils */
    fils_termine = wait(&wstatus) ;

    if (WIFEXITED(wstatus)) {   /* fils terminé avec exit */
        printf("\nMon fils de pid %d a termine avec exit %d\n", fils_termine, WEXITSTATUS(wstatus)) ;
    } else if (WIFSIGNALED(wstatus)) {  /* fils tué par un signal */
        printf("\nMon fils de pid %d a ete tue par le signal %d\n", fils_termine, WTERMSIG(wstatus)) ;
    }

    close(desc_fic_source);
    close(desc_fic_source);

   printf("\nProcessus Principal termine\n") ;
   return EXIT_SUCCESS ;
}
