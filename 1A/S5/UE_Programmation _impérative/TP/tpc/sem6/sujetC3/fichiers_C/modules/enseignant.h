#ifndef ENSEIGNANT__H  // Garde conditionnelle : si la variable DATE__H n'existe pas
#define ENSEIGNANT__H  // La déclarer.
#include "date.h"

struct enseignant {
	char *nom;
	Date *d_naissance;
};
typedef struct enseignant enseignant;
#endif // on clot la garde conditionne à la toute fin du fichier date.h
