#include <stdlib.h> 
#include <stdio.h>

int main(){
    int d1 = 1;
    int d2 = 4; 
    int* p_1 ;
    int* p_2 ;
    p_1 = &d1;
    p_2 = &d2;
    printf("*p_1 = %d, *p_2 = %d\n", *p_1, *p_2);
    return EXIT_SUCCESS;
}
