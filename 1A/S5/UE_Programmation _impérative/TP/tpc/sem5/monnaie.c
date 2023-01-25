#include <stdlib.h> 
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>
#define Taille 5
// Definition du type monnaie
struct monnaie {
        float valeur;
        char  devise;
};

typedef struct monnaie monnaie;

/**
 * \brief Initialiser une monnaie
 * \param[out] monnaie monnaie à initialiser
 * \param[in] valeur de la monnaie initialisée
 * \param[in] devise de la monnaie initialisée
 * \pre valeur > 0
 */ 
void initialiser(monnaie* monnaie, float valeur, char devise){
    assert(valeur > 0);
    (*monnaie).valeur = valeur;
    (*monnaie).devise = devise;
}


/**
 * \brief Ajouter une monnaie m2 à une monnaie m1 
 * \param[in out] monnaie2 monnaie à qui on ajoute m1
 * \param[in] monnaie1 monnaie ajouté à m2
 */ 
bool ajouter(monnaie* monnaie1, monnaie* monnaie2){
    if ((*monnaie1).devise==(*monnaie2).devise) {
       (*monnaie2).valeur+=(*monnaie1).valeur;
       return true;
    }
    else {
        return false;
    }
}


/**
 * \brief Tester Initialiser 
 */ 
void tester_initialiser(){
    monnaie monnaie1, monnaie2;

    initialiser(&monnaie1, 5, 'e');
    assert(monnaie1.valeur==5);
    assert(monnaie1.devise=='e');
    
    initialiser(&monnaie2, 10, '$');
    assert(monnaie2.valeur == 10);
    assert(monnaie2.devise == '$');
    
    printf("Tous les tests de Tester Initialiser sont passés.\n");
}


/**
 * \brief Tester Ajouter 
 */ 
void tester_ajouter(){
    monnaie monnaie1, monnaie2, monnaie3;
    
    initialiser(&monnaie1, 5, 'e');
    assert(monnaie1.valeur==5);
    assert(monnaie1.devise=='e');

    initialiser(&monnaie2, 10, '$');
    assert(monnaie2.valeur == 10);
    assert(monnaie2.devise == '$');
    
    initialiser(&monnaie3, 15, '$');
    assert(monnaie3.valeur == 15);
    assert(monnaie3.devise == '$');

    assert(!ajouter(&monnaie1, &monnaie2));

    ajouter(&monnaie2, &monnaie3);
    assert(monnaie3.valeur==25);
    assert(monnaie3.devise=='$');
    assert(monnaie2.valeur==10);
    assert(monnaie2.devise=='$');

    printf("Tous les tests de Tester Ajouter sont passés.\n");
}



int main(void){
    //Variables
    float valeur;
    char devise;
    float somme;

    // Un tableau de 5 monnaies
    monnaie porte_monnaie[Taille];

    //Initialiser les monnaies
    for (int i=1; i<=Taille; i++) {
        printf("Entrez la valeur de la monnaie numéro %d: ", i);
        scanf("%f", &valeur);
        getchar();
        printf("Entrez la devise de la monnaie numéro %d: ", i);
        scanf("%c", &devise);
        getchar();
        initialiser(&porte_monnaie[i], valeur, devise);
    }
    // Afficher la somme des toutes les monnaies qui sont dans une devise entrée par l'utilisateur.
    printf("Entrez la devise désirée: ");
    scanf("%c", &devise);
    for (int i=1; i<=Taille; i++) {
        if (porte_monnaie[i].devise==devise) {
            somme += porte_monnaie[i].valeur;
        }
    }
    printf("La somme des monnaies qui sont en %c est %1.2f.\n", devise, somme);
    return EXIT_SUCCESS;
}
