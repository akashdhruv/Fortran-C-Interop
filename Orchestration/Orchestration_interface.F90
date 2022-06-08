module Orchestration_interface

    implicit none

#include "Flash.h"

    interface
        subroutine Orchestration_init()
        end subroutine Orchestration_init
    end interface
 
    interface
        subroutine Orchestration_operation(or_scalar,or_vector,or_array)
            integer, intent(inout) :: or_scalar
            real, intent(inout)       :: or_vector(FLASH_VECTOR_LENGTH)
            real, intent(inout)       :: or_array(:,:)
        end subroutine Orchestration_operation
    end interface

    interface
        subroutine Orchestration_finalize()
        end subroutine Orchestration_finalize 
    end interface

end module Orchestration_interface
