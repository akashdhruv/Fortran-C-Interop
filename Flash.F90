program Flash

    use iso_fortran_env, only : int64
    use iso_c_binding
    use Orchestration_interface, only: Orchestration_init, Orchestration_finalize, Orchestration_operation
    use orchestration_module, only: orchestration_real, orchestration_integer, &
                                    or_cnative_array, or_cnative_vector, orchestration_complex

    implicit none

#include "Flash.h"
    
    integer(orchestration_integer), allocatable :: flash_scalar
    real(orchestration_real), allocatable, dimension(:) :: flash_vector
    real(orchestration_real), allocatable, dimension(:,:) :: flash_array
    complex(orchestration_complex), dimension(FLASH_NXB, FLASH_NYB) :: flash_complex
    integer(int64) :: flash_gpu_mem = 8589934592_int64
    integer(C_LONG_LONG) :: flash_gpu_mem_C

    flash_gpu_mem_C = INT(flash_gpu_mem,C_LONG_LONG)

    call Orchestration_init()
    allocate(flash_scalar)
    allocate(flash_vector(FLASH_VECTOR_LENGTH))
    allocate(flash_array(FLASH_NXB,FLASH_NYB))

    flash_scalar = 10
    flash_vector = (/1.5,2.5,3.5/)
    flash_array(:,:) = 0.
    flash_array(2,4) = 15
    or_cnative_array(2,4) = 22
    or_cnative_vector = flash_vector
    flash_complex(2,4) = cmplx(1,4, kind=orchestration_real)

    call Orchestration_operation(flash_scalar,flash_vector,flash_array,flash_complex)

    print *,flash_scalar
    print *,flash_vector
    print *,or_cnative_vector
    print *,flash_array(2,4)
    print *,flash_complex(2,4)

    deallocate(flash_scalar,flash_vector,flash_array)
    call Orchestration_finalize()

end program
