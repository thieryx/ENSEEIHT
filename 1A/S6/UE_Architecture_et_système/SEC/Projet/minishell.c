#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h> /* wait */
#include <string.h>
#include "readcmd.h"
#include <limits.h>
#include "process.h"
#include <fcntl.h>    /* opérations sur les fichiers */
int codeTerm;
pid_t pidFils, idFils;
char current_path[PATH_MAX];
struct cmdline* input;
t_listProcess *listProcess;
sigset_t ens_signaux ;

/* affichage du shell */
void put() {
  getcwd(current_path, sizeof(current_path));
  printf("txu@minishell:~%s$ ", current_path);
  fflush(stdout);
}

/* lire la commande entrée par l'utilisateur */
void readinput() {
    input = readcmd();
}

/* exécuter la commande avec pipe */
void executepipe(struct cmdline *input, int num_argument, int p) {
  int retour_fork, retour_exec, retour_pipe;
  if (input->seq[num_argument+1] == NULL) {
    if (p !=0 ) {
      int retour_dup = dup2(p, 0);
      if (retour_dup < 0 ) {
        printf("Erreur dup2");
        close(p);
        exit(1);
      }
    }
    retour_exec = execvp(input->seq[num_argument][0], input->seq[num_argument]);
    if (retour_exec < 0 ) {
      printf("Erreur execvp");
      exit(1);
    }

  } else {
    int q[2];
    retour_pipe = pipe(q);
    if (retour_pipe < 0) {
      printf("Erreur pipe \n");
      exit(1);
    }

    retour_fork = fork();
    if (retour_fork == -1) {
      printf("Erreur fork\n");
      exit(1);
    }

    if (retour_fork == 0) {
      close(q[0]); //Le fils écrit
      dup2(p,0);
      close(p);
      dup2(q[1],1); //rediger la sortie standard
      retour_exec = execvp(input->seq[num_argument][0], input->seq[num_argument]);
      if (retour_exec < 0 ) {
        printf("Erreur execvp");
        exit(1);
      }
    } else {
      close(q[1]);
      executepipe(input, num_argument+1, q[0]);
    }
  }
}

/* exécuter la commande */
void execute(struct cmdline *input, t_listProcess *listProcess) {
    if (input != NULL) {
      if (input->seq[0] != NULL) {
        // La commande cd
        if (!strcmp((input->seq)[0][0], "cd") && !(input->backgrounded)){
          chdir((input->seq[0][1]));
        }
        // La commande exit
        else if (!strcmp((input->seq)[0][0], "exit") && !(input->backgrounded)){
            exit(0);
        }
        // La commande list jobs
        else if (!strcmp((input->seq)[0][0], "lj") && !(input->backgrounded)){
          putListProcess(listProcess);
        }
        // La commande stop jobs
        else if (!strcmp((input->seq)[0][0], "sj") && !(input->backgrounded)){
          if ((input->seq[0][1]) == NULL) {
            printf("Il manque un argument pour la commande sj\n");
          } else {
            kill(getPid(getPid(atoi(input->seq[0][1]),listProcess),listProcess),SIGSTOP);
          }
        }
        // La commande background
        else if (!strcmp((input->seq)[0][0], "bg") && !(input->backgrounded)){
          if ((input->seq[0][1]) == NULL) {
            printf("Il manque un argument pour la commande bg\n");
          } else {
            kill(getPid(atoi(input->seq[0][1]),listProcess),SIGCONT);
          }
        }
        // La commande foreground
        else if (!strcmp((input->seq)[0][0], "fg") && !(input->backgrounded)){
          if ((input->seq[0][1]) == NULL) {
            printf("Il manque un argument pour la commande fg\n");
          } else {
            int pid = getPid(atoi(input->seq[0][1]), listProcess);
            kill(pid ,SIGCONT);
            waitpid(pid, NULL, WUNTRACED);
            deleteProcess(pid, listProcess);

          }
        }

      else {
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
          sigdelset(&ens_signaux, SIGTSTP);
          sigprocmask(SIG_SETMASK,&ens_signaux, 0);

          /* Sortie standard */
          if (input->out != NULL) {
            int desc_sortie = open((input->out), O_WRONLY | O_CREAT | O_TRUNC, 0640);
            if (desc_sortie < 0) {
              perror("Error ");
              exit(1);
        	  }
            dup2(desc_sortie,1);
            close(desc_sortie);
          }

          /* Entree standard */
          if ((input->in) != NULL) {
            int desc_entree = open((input->in), O_RDONLY);
            if (desc_entree < 0) {
              perror("Error ");
              exit(1);
            }
            dup2(desc_entree, 0);
            close(desc_entree);
          }

          executepipe(input, 0, 0);
          //execvp((input->seq)[0][0], (input->seq)[0]);

        } else {   /* père */
          if (!input->backgrounded) {
            idFils=waitpid(pidFils, &codeTerm, WUNTRACED | WCONTINUED);
            if (idFils == -1) {
              perror("wait ");
              exit(2);
            }

          } else {
            addProcess(pidFils, (input->seq)[0][0], listProcess);

          }
        }
      }
    }
  }
}



/* Traitant du signal SIGCHLD */
void handler_chld(int signal_num) {
  int fils_termine, wstatus ;
  if (signal_num == SIGCHLD) {
    while ((fils_termine = (int) waitpid(-1, &wstatus, WNOHANG | WUNTRACED | WCONTINUED)) > 0) {
      if WIFEXITED(wstatus) {
        deleteProcess(fils_termine, listProcess);
      } else if WIFSIGNALED(wstatus) {
        deleteProcess(fils_termine, listProcess);
      } else if WIFSTOPPED(wstatus) {
        changeState(fils_termine, Suspendu, listProcess);
      } else if WIFCONTINUED(wstatus) {
        changeState(fils_termine, Actif, listProcess);
      }
    }
  }
}

/* Traitant du signal SIGTSTP / CTRL-Z */
void handler_SIGTSTP(int signal_num) {
  addProcess(pidFils, (input->seq)[0][0], listProcess);
  changeState(pidFils, Suspendu, listProcess);
  printf("\n");
  kill(pidFils, SIGSTOP);
}
/* Traitant du signal SIGINT /  CTRL-C */
void handler_SIGINT(int signal_num) {
	kill(pidFils, SIGKILL);
}

int main() {
  signal(SIGCHLD, handler_chld);
  signal(SIGINT, handler_SIGINT);
  signal(SIGTSTP, handler_SIGTSTP);
  sigemptyset(&ens_signaux);
	sigaddset(&ens_signaux, SIGTSTP);
  listProcess = malloc(sizeof(t_listProcess));
  listProcess->nbProcess = 0;
  while (1) {
    put();
    readinput();
    execute(input, listProcess);
  }
  return EXIT_SUCCESS;
}
