#include "aux.h"
#include "omp.h"

int main(int argc, char **argv)
{
  long t_start, t_end;
  int l, t, L, T;
  Token token;

  if (argc == 3)
  {
    L = atoi(argv[1]); /* number of loops */
    T = atoi(argv[2]); /* number of threads */
  }
  else
  {
    printf("Usage:\n\n ./main L T\n\nsuch that L is the number of loops and T the number of threads to use.\n");
    return 1;
  }

  init(&token, L, T);

  for (l = 0; l < L; l++)
  {
#pragma omp parallel for ordered
    for (int i = 0; i < omp_get_num_threads(); i++)
    {
      // printf("Loop %2d, %d\n", l, i);
#pragma omp ordered
      process(&token);
    }
  }

#pragma omp single

  check(&token, L, T);

  return 0;
}

/*

Commentaire:
je triche un peu en utilisant "ordered". Mais cela simplifie grandement l'exercice.

*/
