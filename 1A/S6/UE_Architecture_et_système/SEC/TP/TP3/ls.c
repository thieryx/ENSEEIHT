#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h> /* wait */

int main(int argc, char *argv[]) {
  pid_t pidFils;
  pidFils=fork();

  char *Tableau[4] = { "/bin/ls", "-l", "test", NULL};
  /* bonne pratique : tester systématiquement le retour des appels système */
  if (pidFils == -1) {
    printf("Erreur fork\n");
    exit(1);
    /* par convention, renvoyer une valeur > 0 en cas d'erreur,
     * différente pour chaque cause d'erreur
     */
  }
  if (pidFils == 0) {  /* fils */
    execv(Tableau[0], Tableau);
    /* on ne se retrouve ici que si exec échoue */
    printf("\n     Processus fils numero %d : ERREUR EXEC\n", pidFils) ;
    /* perror : affiche un message relatif à l'erreur du dernier appel systàme */
    perror("     exec ") ;
    exit(pidFils) ;   /* sortie avec le numéro di fils qui a échoué */
  }

  printf("\nProcessus Principal termine\n") ;
  return EXIT_SUCCESS; /* -> exit(EXIT_SUCCESS); pour le père */
}
