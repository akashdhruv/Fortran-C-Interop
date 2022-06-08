program Flash

    use iso_fortran_env, only : int64
    use iso_c_binding
    use Orchestration_interface, only: Orchestration_init, Orchestration_finalize, Orchestration_operation

    implicit none

#include "Flash.h"
    
    integer, allocatable :: flash_scalar
    real, allocatable, dimension(:) :: flash_vector
    real, allocatable, dimension(:,:) :: flash_array
    integer(int64) :: flash_gpu_mem = 8589934592_int64
    integer(C_LONG_LONG) :: flash_gpu_mem_C

    flash_gpu_mem_C = INT(flash_gpu_mem,C_LONG_LONG)

    allocate(flash_scalar)
    allocate(flash_vector(FLASH_VECTOR_LENGTH))
    allocate(flash_array(FLASH_NXB,FLASH_NYB))

    flash_scalar = 10
    flash_vector = (/1.5,2.5,3.5/)
    flash_array(:,:) = 0.
    flash_array(1,1) = 10.

    call Orchestration_init()
    call Orchestration_operation(flash_scalar,flash_vector,flash_array)
    call Orchestration_finalize()

    print *,flash_scalar
    print *,flash_vector
    print *,flash_array(1,1)
    print *,flash_gpu_mem
    print *,flash_gpu_mem_C

    deallocate(flash_scalar,flash_vector,flash_array)

end program
