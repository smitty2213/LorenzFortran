MODULE rk4_mod          ! Name of the module
    USE lorenz_mod, only: lorenz_rhs        ! Calls the lorenz_mod and uses the lorenz_rhs subroutine
    IMPLICIT none       ! Module variables 
CONTAINS
    
    SUBROUTINE rk4_step(x, y, z, h, sigma, rho, beta)       ! The subroutine that is called in Lorenz_Main
        IMPLICIT none
        
    ! Declare Variables
        REAL, INTENT(inout) :: x, y, z          ! Can be modified by the subroutine
        REAL, INTENT(in)    :: h, sigma, rho, beta          ! Only input, subroutine can not modify  
        
        ! Declaring variables
        REAL :: k1x, k1y, k1z       
        REAL :: k2x, k2y, k2z
        REAL :: k3x, k3y, k3z
        REAL :: k4x, k4y, k4z
        REAL :: x2, y2, z2
        REAL :: x3, y3, z3
        REAL :: x4, y4, z4

        ! Calculate k1
        CALL lorenz_rhs(x, y, z, sigma, rho, beta, k1x, k1y, k1z)

        ! Calculate k2
        x2 = x + (k1x * (h/2.0))
        y2 = y + (k1y * (h/2.0))
        z2 = z + (k1z * (h/2.0))

        CALL lorenz_rhs(x2, y2, z2, sigma, rho, beta, k2x, k2y, k2z)

        ! Calculate k3
        x3 = x + (k2x * (h/2.0))
        y3 = y + (k1y * (h/2.0))
        z3 = z + (k1z * (h/2.0))

        CALL lorenz_rhs(x3, y3, z3, sigma, rho, beta, k3x, k3y, k3z)

        ! Calculate k4
        x4 = x + (h * k3x)
        y4 = y + (h * k3y)
        z4 = z + (h * k3z)

        CALL lorenz_rhs(x4, y4, z4, sigma, rho, beta, k4x, k4y, k4z)

        x = x + (h/6.0) * (k1x + (2*k2x) + (2*k3x) + k4x)
        y = y + (h/6.0) * (k1y + (2*k2y) + (2*k3y) + k4y)
        z = z + (h/6.0) * (k1z + (2*k2z) + (2*k3z) + k4z)

        
    END SUBROUTINE rk4_step
END MODULE rk4_mod