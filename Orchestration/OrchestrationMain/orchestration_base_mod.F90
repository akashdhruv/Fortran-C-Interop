module orchestration_base_module

    use iso_c_binding
   
    implicit none

    !--------------------------------------------------
    !--C++/FORTRAN datatypes
    !--------------------------------------------------

    integer, parameter :: orchestration_real = C_DOUBLE
    integer, parameter :: orchestration_integer = C_INT

    !--------------------------------------------------
    !--Interface to C++ routines
    !--------------------------------------------------

    interface
        subroutine orchestration_compute_fi(or_scalar,or_vector,or_array) bind(c,name="orchestration_compute_fi")
            import
            type(c_ptr), value :: or_scalar,or_vector,or_array
        end subroutine orchestration_compute_fi
    end interface

    !--------------------------------------------------
    !--Interface to FORTRAN routines
    !--------------------------------------------------

    contains
        subroutine orchestration_compute(or_scalar,or_vector,or_array)
            integer, intent(inout)         :: or_scalar
            real, target, intent(inout)    :: or_vector(:)
            real, target, intent(inout)    :: or_array(:,:)

            integer(orchestration_integer), target :: or_c_scalar

            or_c_scalar = INT(or_scalar,orchestration_integer)

            call orchestration_compute_fi(C_LOC(or_c_scalar),C_LOC(or_vector),C_LOC(or_array))

            !or_scalar = INT(or_c_scalar)

        end subroutine

end module orchestration_base_module
