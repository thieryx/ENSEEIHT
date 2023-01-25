

/** Squelette du programme **/
/*********************************************************************
 *  Auteur  :  
 *  Version : 
 *  Objectif : Conversion pouces/centimètres
 ********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#define un_pouce 2.54


int main(void)
{
        float valeur;
        char unite ;
        float lg_cm ;
        float lg_p ;
        
        printf("Entrer une longueur (valeur + unité) : ");
        scanf("%f",&valeur);
        scanf("%c",&unite);

        switch (unite) {
        case 'p':
        case 'P':
                lg_p = valeur;
                lg_cm = lg_p*un_pouce;
                break;
        case 'c':
        case 'C':
                lg_cm = valeur;
                lg_p = lg_cm/un_pouce;
                break;
        case 'm':
        case 'M':
                lg_cm = valeur*100;
                lg_p = lg_cm/un_pouce;
                break;
        default:
                lg_p = 0;
                lg_cm = 0;
         }
printf("%f p = %f cm",lg_p,lg_cm);        

}


        
