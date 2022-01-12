module myLib

    use iso_c_binding

    implicit none


    integer, parameter :: dp = selected_real_kind(15, 307)

contains


    real(kind=dp)  function binomial(n,k) result(coefficient) &
        bind (C, name="myLib_binomial")
  
        implicit none

        integer, intent(in) :: n, k
        integer :: numerator, i
  
        if (k == 0) then
            coefficient = 1
        else
            coefficient = 1.0D0
            do i = 1, k
                numerator = n + 1 -i
                coefficient = coefficient * real(numerator)/real(i)
            end do
        end if
  
    end function binomial

end module myLib