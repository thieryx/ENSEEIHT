#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h> /* wait */
#include <string.h>

int main(int argc, char *argv[]) {
  int codeTerm;
  pid_t pidFils, idFils;

  while (1) {
    pidFils=fork();

    /* bonne pratique : tester systématiquement le retour des appels système */
    if (pidFils == -1) {
      printf("Erreur fork\n");
      exit(1);
      /* par convention, renvoyer une valeur > 0 en cas d'erreur,
      * différente pour chaque cause d'erreur
      */
    }
    if (pidFils == 0) {  /* fils */
      char buf[30]; /* contient la commande saisie au clavier */
      char tmp[36] = "/bin/";
      int ret ; /* valeur de retour de scanf */
      printf("Entrer le nom de la commande (sans paramètre) de moins de 30 caractères:");
      printf(">>> ");

      /* lit et range dans buf la chaine entrée au clavier */
      ret = scanf("%s", buf) ;

      /* Sortie de la boucle si "exit" est détecté */
      if (strcmp(buf, "exit") == 0 || ret == EOF) {
        exit(3);
      }

      /* Exécution */
      strcat(tmp, buf);
      execl(tmp, "", NULL);

      /* on se retrouve ici si exec échoue, on affiche l'erreur*/
      perror("Erreur d'exécution ");
      exit(1);
    }
    else {   /* père */
      idFils=wait(&codeTerm);
      if (idFils == -1) {
        perror("wait ");
        exit(2);
      }
      if (WEXITSTATUS(codeTerm) == 1 ) {
        printf("ECHEC la commande ne s'est pas exécutée.");
      } else if (WEXITSTATUS(codeTerm) == 3) {
          exit(EXIT_SUCCESS);
      } else {
        printf("SUCCES la commande s'est exécutée.");
      }
    }
  }
}
