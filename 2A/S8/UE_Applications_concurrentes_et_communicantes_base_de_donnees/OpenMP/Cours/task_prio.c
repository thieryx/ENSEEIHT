#include <aux.h>






int main() {
int a, b, c, x, y;
double t=secs();
#pragma omp parallel
{
#pragma omp master
  {
#pragma omp task depend(out:b) priority(1)
    b = f_b();

#pragma omp task depend(out:c) priority(1)
    c = f_c();

#pragma omp task depend(out:a)
    a = f_a();

#pragma omp task depend(in:b,c) depend(out:x) priority(2)
    x = f_x(b, c);

#pragma omp task depend(in:a,x) depend(out:y) priority(2)
    y = f_y(a, x);

#pragma omp taskwait
    printf("y: %d (correct value is 9) and time is %f\n",y,secs()-t);
  }
}
return 0;
}
