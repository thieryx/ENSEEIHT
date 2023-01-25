#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <math.h>
// Definition du type Point
struct Point {
        int X;
        int Y;
};

int main(){
    // Déclarer deux variables ptA et ptB de types Point
    struct Point PtA, PtB;
    // Initialiser ptA à (0,0)
    PtA.X=0;
    PtA.Y=0;
    // Initialiser ptB à (10,10)
    PtB.X=10;
    PtB.Y=10;
    // Calculer la distance entre ptA et ptB.
    float distance = 0;
    float dX_carre = 0;
    float dY_carre = 0;
    dX_carre = pow(PtA.X-PtB.X,2);
    dY_carre = pow(PtA.Y-PtB.Y,2);
    distance=pow(dX_carre+dY_carre,0.5);
    assert((distance*distance) == 200);
    
    return EXIT_SUCCESS;
}
