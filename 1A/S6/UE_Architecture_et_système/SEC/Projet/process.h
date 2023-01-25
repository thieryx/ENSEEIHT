#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

#ifndef PROCESS_H
#define PROCESS_H

/* Type caractérisant l'état d'un processus */
typedef enum state { Actif, Suspendu} t_state;

/* Type caractérisant un processus */
typedef struct process {
    int ident; //identifiant du processus
    pid_t pid; //pid du processus
    char *cmd; //la commande
    t_state state; //etat du processus
} t_process;

/* Type de la liste des processus */
typedef struct listProcess  {
    t_process *process; // les processus
    int nbProcess; // nombre de processus
} t_listProcess;

/* Afficher les processus */
void putListProcess (t_listProcess *listProcess);

/* Ajouter un processus dans la liste */
int addProcess(pid_t pid, char *cmd, t_listProcess *listProcess);

/* Supprimer un processus dans la liste */
int deleteProcess(pid_t pid, t_listProcess *listProcess);

/* Changer l'état d'un processus dans la liste */
void changeState(pid_t pid, t_state state, t_listProcess *listProcess);

/* Obtenir le pid d'un processus à partir de son identifiant */
pid_t getPid(int ident, t_listProcess *listProcess);

#endif
