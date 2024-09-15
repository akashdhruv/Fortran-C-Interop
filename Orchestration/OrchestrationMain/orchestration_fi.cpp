#include <orchestration.h>

extern "C"{
  void orchestration_compute_fi (int& or_scalar,double* or_vector,double* or_array,std::complex<double>* or_complex){
    FArray1D<double> or_fvector(or_vector, OR_VECTOR_LENGTH);
    FArray2D<double> or_farray(or_array, OR_NXB, OR_NYB);
    FArray2D<std::complex<double>> or_fcomplex(or_complex, OR_NXB, OR_NYB);
    orchestration_compute(or_scalar,or_fvector, or_farray, or_fcomplex);
  }

  double *orchestration_cnative_array() {
    return or_cnative_array.data;
  }

  double *orchestration_cnative_vector() {
    return or_cnative_vector.data;
  }
}
