subroutine Orchestration_operation(or_scalar,or_vector,or_array,or_complex)

    use orchestration_module, only: orchestration_compute, orchestration_real, orchestration_complex

    implicit none

#include "Flash.h"

    integer,intent(inout) :: or_scalar
    real(orchestration_real), intent(inout)   :: or_vector(FLASH_VECTOR_LENGTH)
    real(orchestration_real), intent(inout)   :: or_array(:,:)
    complex(orchestration_complex), intent(inout) :: or_complex(FLASH_NXB,FLASH_NYB)

    call orchestration_compute(or_scalar,or_vector,or_array,or_complex)


end subroutine Orchestration_operation
