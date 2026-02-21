MODULE rk4_mod          ! Name of the module
    IMPLICIT none       ! Module variables 
CONTAINS
    
    SUBROUTINE rk4_step(x, y, z, h, sigma, rho, beta)       ! The subroutine that is called in Lorenz_Main
        IMPLICIT none
        
    ! Declare Variables
        REAL, INTENT(inout) :: x, y, z          ! Can be modified by the subroutine
        REAL, INTENT(in)    :: h, sigma, rho, beta          ! OOnly input, subroutine can not modify  
        
        
    
    END SUBROUTINE rk4_step