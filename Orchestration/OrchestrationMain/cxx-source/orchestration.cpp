#include <orchestration.h>

FArray2D<double> or_cnative_array(OR_NXB,OR_NYB);
FArray1D<double> or_cnative_vector(OR_VECTOR_LENGTH);

void orchestration_compute (int& or_scalar,FArray1D<double>& or_vector,FArray2D<double>& or_array,FArray2D<std::complex<double>>& or_complex){
  or_scalar = or_scalar+10;
  or_vector(0) = or_vector(0)+10;
  or_array(1,3) = or_array(1,3)+1000;
  or_cnative_array(1,3) = or_cnative_array(1,3)+1000;

  std::cout<<or_cnative_vector(0)<<std::endl;
  std::cout<<or_cnative_array(1,3)<<std::endl;
  std::cout<<or_complex(1,3)<<std::endl;

  or_complex(1,3) = std::complex<double>(3,5);

}
