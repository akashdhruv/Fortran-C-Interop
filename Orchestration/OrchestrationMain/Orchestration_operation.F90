subroutine Orchestration_operation(or_scalar,or_vector,or_array)

    use orchestration_module, only: orchestration_compute, orchestration_real

    implicit none

#include "Flash.h"

    integer,intent(inout) :: or_scalar
    real(orchestration_real), intent(inout)   :: or_vector(FLASH_VECTOR_LENGTH)
    real(orchestration_real), intent(inout)   :: or_array(:,:)

    call orchestration_compute(or_scalar,or_vector,or_array)


end subroutine Orchestration_operation
