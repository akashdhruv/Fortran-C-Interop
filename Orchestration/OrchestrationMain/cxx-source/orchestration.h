#ifndef ORCHESTRATION_MOD
#define ORCHESTRATION_MOD

#include <stdio.h>
#include <iostream>
#include <Flash.h>

#define OR_VECTOR_LENGTH FLASH_VECTOR_LENGTH
#define OR_NXB FLASH_NXB 
#define OR_NYB FLASH_NYB

extern double or_cnative_array[OR_NXB][OR_NYB];
extern double or_cnative_vector[OR_VECTOR_LENGTH];

extern void orchestration_compute (int& or_scalar,double or_vector[OR_VECTOR_LENGTH],double or_array[OR_NYB][OR_NXB]);

#endif
