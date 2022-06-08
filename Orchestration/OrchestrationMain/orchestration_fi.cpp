#include <orchestration.h>

extern "C" 
{
    void orchestration_compute_fi (int& or_scalar,double* or_vector,double* or_array[OR_NXB][OR_NYB])
        {
            orchestration_compute(or_scalar,or_vector,or_array);
        }
}
