#include <stdio.h>    /* entrées sorties */
#include <unistd.h>   /* pimitives de base : fork, ...*/
#include <stdlib.h>   /* exit */
#include <sys/wait.h> /* wait */
#include <sys/types.h>
#include <string.h>   /* opérations sur les chaines */
#include <fcntl.h>    /* opérations sur les fichiers */

int main(int argc, char **argv)
{
    int pipe_f2p[2], pipe_pf2f[2];
    pid_t fils, petit_fils;
    if (pipe(pipe_f2p) == -1) {
        printf("Erreur pipe\n");
        exit(1);
    }

    fils = fork();

    if (fils < 0) {
        printf("Erreur fork\n");
        exit(1);
    }

    //fils
    if (fils == 0) {
        close(pipe_f2p[0]);
        if (dup2(pipe_f2p[1], 1) == -1) {
            perror("Erreur dupe2\n");
            exit(1);
        }

        close(pipe_f2p[1]);

        if (pipe(pipe_pf2f) == -1) {
            perror("Erreur pipe\n");
            exit(1);
        }

        // Creation du petit_fils
        petit_fils = fork();

        if (petit_fils < 0) {
            perror("Erreur fork\n");
            exit(1);
        }

        // petit_fils
        if (petit_fils == 0) {
            close(pipe_pf2f[0]);

            if (dup2(pipe_pf2f[1], 1) == -1) {
                perror("Erreur dup2\n");
                exit(1);
            }
            close(pipe_pf2f[1]);
            execlp("who", "who", NULL);
        }

        // fils
        else {
            close(pipe_pf2f[1]);

            if (dup2(pipe_pf2f[0], 0) == -1) {
                perror("Erreur dup2\n");
                exit(1);
            }
            close(pipe_pf2f[0]);
            execlp("grep", "grep", argv[1], NULL);
        }

        exit(0);
    }
    // père
    else {
        close(pipe_f2p[1]);
        if (dup2(pipe_f2p[0],0) == -1) {
            perror("Erreur dup2\n");
            exit(1);
        }
        close(pipe_f2p[0]);

        execlp("wc", "wc", "-l", NULL);

    }

    return EXIT_SUCCESS;

}
