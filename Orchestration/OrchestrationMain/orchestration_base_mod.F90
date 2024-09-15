module orchestration_base_module

    use iso_c_binding

    implicit none

#include "Flash.h"

    !--------------------------------------------------
    !--C++/FORTRAN datatypes
    !--------------------------------------------------

    integer, parameter :: orchestration_real = C_DOUBLE
    integer, parameter :: orchestration_integer = C_INT
    integer, parameter :: orchestration_complex = C_DOUBLE_COMPLEX
    real(orchestration_real), pointer, dimension(:,:) :: or_cnative_array => null()
    real(orchestration_real), pointer, dimension(:) :: or_cnative_vector => null()

    !--------------------------------------------------
    !--Interface to C++ routines
    !--------------------------------------------------

    interface
        subroutine orchestration_compute_fi(or_scalar,or_vector,or_array,or_complex) bind(c,name="orchestration_compute_fi")
            import
            integer(orchestration_integer) :: or_scalar
            real(orchestration_real), dimension(FLASH_VECTOR_LENGTH) :: or_vector
            real(orchestration_real), dimension(FLASH_NYB,FLASH_NXB) :: or_array
            complex(orchestration_complex), dimension(FLASH_NYB,FLASH_NXB) :: or_complex
        end subroutine orchestration_compute_fi

        function orchestration_cnative_array() bind(C, name="orchestration_cnative_array")
            import
            type(c_ptr) :: orchestration_cnative_array
        end function orchestration_cnative_array

        function orchestration_cnative_vector() bind(C, name="orchestration_cnative_vector")
            import
            type(c_ptr) :: orchestration_cnative_vector
        end function orchestration_cnative_vector
    end interface

    !--------------------------------------------------
    !--Interface to FORTRAN routines
    !--------------------------------------------------

    contains
        subroutine orchestration_compute(or_scalar,or_vector,or_array,or_complex)
            implicit none
            integer, intent(inout) :: or_scalar
            real(orchestration_real), intent(inout) :: or_vector(:)
            real(orchestration_real), intent(inout) :: or_array(:,:)
            complex(orchestration_complex), intent(inout) :: or_complex(FLASH_NXB,FLASH_NYB)
            call orchestration_compute_fi(or_scalar,or_vector,or_array,or_complex)
        end subroutine

        subroutine orchestration_mod_init()
            implicit none
            call c_f_pointer(orchestration_cnative_vector(), or_cnative_vector, [FLASH_VECTOR_LENGTH])
            call c_f_pointer(orchestration_cnative_array(), or_cnative_array, [FLASH_NXB,FLASH_NYB])
        end subroutine orchestration_mod_init

        subroutine orchestration_mod_finalize()
            implicit none
            or_cnative_array => null()
            or_cnative_vector => null()
        end subroutine orchestration_mod_finalize

end module orchestration_base_module
