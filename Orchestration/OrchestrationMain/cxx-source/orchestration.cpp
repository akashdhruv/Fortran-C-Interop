#include <orchestration.h>

FArray2D<double> or_cnative_array(OR_NXB,OR_NYB);
double or_cnative_vector[OR_VECTOR_LENGTH];

void orchestration_compute (int& or_scalar,double or_vector[OR_VECTOR_LENGTH],FArray2D<double>& or_array){
  or_scalar = or_scalar+10;
  or_vector[0] = or_vector[0]+10;
  or_array(1,3) = or_array(1,3)+1000;
  or_cnative_array(1,3) = or_cnative_array(1,3)+1000;
  std::cout<<or_cnative_vector[0]<<std::endl;
  std::cout<<or_cnative_array(1,3)<<std::endl;
}
