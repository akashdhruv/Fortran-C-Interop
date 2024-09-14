#include <orchestration.h>

extern "C"{
  void orchestration_compute_fi (int& or_scalar,double or_vector[OR_VECTOR_LENGTH],double or_array[OR_NYB][OR_NXB]){
    orchestration_compute(or_scalar,or_vector,or_array);
  }

  double (*orchestration_cnative_array())[OR_NYB] {
    return or_cnative_array;
  }

  double *orchestration_cnative_vector() {
    return or_cnative_vector;
  }
}
