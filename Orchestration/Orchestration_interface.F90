module Orchestration_interface

    implicit none

#include "Flash.h"

    interface
        subroutine Orchestration_init()
        end subroutine Orchestration_init
    end interface
 
    interface
        subroutine Orchestration_operation(or_scalar,or_vector,or_array,or_complex)
            use orchestration_module, only: orchestration_real, orchestration_complex
            integer, intent(inout) :: or_scalar
            real(orchestration_real), intent(inout)       :: or_vector(FLASH_VECTOR_LENGTH)
            real(orchestration_real), intent(inout)       :: or_array(:,:)
            complex(orchestration_complex), intent(inout) :: or_complex(FLASH_NXB, FLASH_NYB)
        end subroutine Orchestration_operation
    end interface

    interface
        subroutine Orchestration_finalize()
        end subroutine Orchestration_finalize 
    end interface

end module Orchestration_interface
