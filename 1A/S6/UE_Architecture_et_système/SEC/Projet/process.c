#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include "process.h"

void putListProcess(t_listProcess *listProcess) {
    if (listProcess) {
        printf("ID  PID  ETAT  CMD\n");
        for (int i = 0; i < listProcess->nbProcess; i++) {
            if (((&(listProcess->process[i]))->state) == Actif) {
                printf("%d %d %s %s\n", (&(listProcess->process[i]))->ident,
                    (&(listProcess->process[i]))->pid, "Actif", (&(listProcess->process[i]))->cmd);
            } else {
                printf("%d %d %s %s\n", (&(listProcess->process[i]))->ident,
                    (&(listProcess->process[i]))->pid, "Suspendu", (&(listProcess->process[i]))->cmd);
            }
        }
    }
}

int addProcess(pid_t pid, char *cmd, t_listProcess *listProcess) {
    t_process *tmp = realloc(listProcess->process, (listProcess->nbProcess + 1)*sizeof(t_process));
    if (tmp) {
        // recopie de l'adressse uniquement si succès
        (&(tmp[listProcess->nbProcess]))->ident = listProcess->nbProcess + 1;
        (&(tmp[listProcess->nbProcess]))->pid = pid;
        (&(tmp[listProcess->nbProcess]))->cmd = cmd;
        (&(tmp[listProcess->nbProcess]))->state = Actif;
        (&(tmp[listProcess->nbProcess]))->cmd = malloc(sizeof(char));
        strcpy((&(tmp[listProcess->nbProcess]))->cmd, cmd);
        listProcess->process = tmp;
        listProcess->nbProcess = listProcess->nbProcess + 1;
        return EXIT_SUCCESS;
    } else {
        return EXIT_FAILURE;
    }
}

int deleteProcess(pid_t pid, t_listProcess *listProcess) {
    int cpt = 0;
    if (listProcess->nbProcess > 0) {
        t_process *tmp = calloc(listProcess->nbProcess, sizeof(t_process));

        if (tmp) {
            // recopie de l'adressse uniquement si succès
            for (int i = 0; i < listProcess->nbProcess; i++) {
                if ((&(listProcess->process[i]))->pid == pid) {
                    cpt=i;
                } else {
                    (&(tmp[cpt]))->ident = (&(listProcess->process[i]))->ident;
                    (&(tmp[cpt]))->pid = (&(listProcess->process[i]))->pid;
                    (&(tmp[cpt]))->cmd = (&(listProcess->process[i]))->cmd;
                    (&(tmp[cpt]))->state = (&(listProcess->process[i]))->state;
                    cpt++;
                }
            }
            listProcess->process = tmp;
            listProcess->nbProcess = listProcess->nbProcess - 1;
            return EXIT_SUCCESS;
        }
    }
    return EXIT_FAILURE;
}

void changeState(pid_t pid, t_state state, t_listProcess *listProcess) {
    if (listProcess) {
        for (int i = 0; i< listProcess->nbProcess; i++) {
            if ((&(listProcess->process[i]))->pid == pid) {
                (&(listProcess->process[i]))->state = state;
            }
        }
    }
}

pid_t getPid(int ident, t_listProcess *listProcess) {
    pid_t pid;
    if (listProcess) {
        for (int i =0 ; i < listProcess->nbProcess; i++) {
            if ((&(listProcess->process[i]))->ident == ident) {
                pid = (&(listProcess->process[i]))->pid;
            }
        }
        return pid;
    } else {
        return -1;
    }
}
