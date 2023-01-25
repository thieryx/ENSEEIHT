/**
 *  \author Xavier Cr�gut <nom@n7.fr>
 *  \file file.c
 *
 *  Objectif :
 *	Implantation des op�rations de la file
*/

#include <malloc.h>
#include <assert.h>

#include "file.h"


void initialiser(File *f)
{
    f->tete = malloc(sizeof(Cellule));
    f->queue = NULL;
    f->tete = NULL;
    assert(est_vide(*f));
}


void detruire(File *f)
{
    if (f->tete == NULL) {
    } else {
      free(f->tete);
      f->tete = NULL;
    }
}


char tete(File f)
{
    assert(! est_vide(f));

    return (f.tete->valeur);
}


bool est_vide(File f)
{
    return (f.tete == NULL);
}

/**
 * Obtenir une nouvelle cellule allou�e dynamiquement
 * initialis�e avec la valeur et la cellule suivante pr�cis� en param�tre.
 */
static Cellule * cellule(char valeur, Cellule *suivante)
{
    Cellule *cellule = malloc(sizeof(char) + sizeof(suivante));
    cellule->valeur = valeur;
    cellule->suivante = suivante;
    return cellule;
}


void inserer(File *f, char v)
{
    assert(f != NULL);

    if (f->tete == NULL) {
      f->tete = cellule(v, NULL);
      f->queue = f->tete;
    } else {
      f->queue->suivante = cellule(v, NULL);
      f->queue = f->queue->suivante;
    }
}

void extraire(File *f, char *v)
{
    assert(f != NULL);
    assert(! est_vide(*f));

    *v = f->tete->valeur;
    Cellule *tmp = f->tete->suivante;
    free(f->tete);
    f->tete = tmp;
}


int longueur(File f)
{
    if (est_vide(f)) {
      return 0;
    } else {
      File pointeur;
      pointeur.tete = f.tete->suivante;
      return 1 + longueur(pointeur);
    }
}
