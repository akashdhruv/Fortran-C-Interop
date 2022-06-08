#include <orchestration.h>

void orchestration_compute (int& or_scalar,double* or_vector,double* or_array[OR_NXB][OR_NYB])
{
    or_scalar = or_scalar+10;
    or_vector[0] = or_vector[0]+10;
    //or_array[0][0] = or_array[0,0]+5;
}
