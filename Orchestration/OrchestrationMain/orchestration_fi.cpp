#include <orchestration.h>

extern "C"{
  void orchestration_compute_fi (int& or_scalar,double or_vector[OR_VECTOR_LENGTH],double* or_array){
    FArray2D<double> or_farray(or_array, OR_NXB, OR_NYB);
    orchestration_compute(or_scalar,or_vector, or_farray);
  }

  double *orchestration_cnative_array() {
    return or_cnative_array.data;
  }

  double *orchestration_cnative_vector() {
    return or_cnative_vector;
  }
}
