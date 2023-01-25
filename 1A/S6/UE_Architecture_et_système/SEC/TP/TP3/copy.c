#include <stdio.h>    /* entrées sorties */
#include <unistd.h>   /* pimitives de base : fork, ...*/
#include <stdlib.h>   /* exit */
#include <sys/wait.h> /* wait */
#include <sys/types.h>
#include <string.h>   /* opérations sur les chaines */
 #include <fcntl.h>    /* opérations sur les fichiers */


int main()
{
   int fils, retour, desc_fic, fils_termine, wstatus ;

   char fichier[] = "fic_centaines.txt" ;
   char tmp[BUFFERSIZE] ;     /* buffer de lecture */

   /* Initialiser buffer avec 0 */
   bzero(tmp, sizeof(tmp)) ;

   /* ouverture du fichier en lecture */
   desc_fic = open(fichier_source, O_RDONLY) ;

   /* traiter systématiquement les retours d'erreur des appels */
   if (desc_fic < 0) {
       printf("Erreur ouverture %s\n", fichier_source) ;
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

           if (fils == NB_FILS) {
               lseek(desc_fic, 4, SEEK_SET) ;
           }
           /* lire le fichier par blocs de 4 octets */
           while (read(desc_fic, tmp, 4) > 0) {

               printf("     Processus fils numero %d a lu %s\n",
                       fils, buffer) ;
               if (fils == 1) {
                   lseek(desc_fic, 4, SEEK_CUR) ;
               }
               sleep(duree_sommeil) ;
               bzero(buffer, sizeof(buffer)) ;
           }
           /* Important : terminer un processus par exit */
           exit(EXIT_SUCCESS) ;   /* Terminaison normale (0 = sans erreur) */
       }

       /* pere */
       else {
           printf("\nProcessus de pid %d a cree un fils numero %d, de pid %d \n",
                   getpid(), fils, retour) ;
       }
   }

   /* attendre la fin des fils */
   for (fils = 1 ; fils <= NB_FILS ; fils++) {
       /* attendre la fin d'un fils */
       fils_termine = wait(&wstatus) ;

       if WIFEXITED(wstatus) {   /* fils terminé avec exit */
           printf("\nMon fils de pid %d a termine avec exit %d\n",
                   fils_termine, WEXITSTATUS(wstatus)) ;
       }
       else if WIFSIGNALED(wstatus) {  /* fils tué par un signal */
           printf("\nMon fils de pid %d a ete tue par le signal %d\n",
                   fils_termine, WTERMSIG(wstatus)) ;
       }
   }
   close(desc_fic) ;
   printf("\nProcessus Principal termine\n") ;
   return EXIT_SUCCESS ;
}
