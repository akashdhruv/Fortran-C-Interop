#ifndef ORCHESTRATION_MOD
#define ORCHESTRATION_MOD

#include<complex>
#include <stdio.h>
#include <iostream>
#include <Flash.h>
#include <FArray.h>

#define OR_VECTOR_LENGTH FLASH_VECTOR_LENGTH
#define OR_NXB FLASH_NXB 
#define OR_NYB FLASH_NYB

extern FArray2D<double> or_cnative_array;
extern FArray1D<double> or_cnative_vector;

extern void orchestration_compute (int& or_scalar,FArray1D<double>& or_vector,FArray2D<double>& or_array,FArray2D<std::complex<double>>& or_complex);

#endif
