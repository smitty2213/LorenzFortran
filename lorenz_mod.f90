MODULE lorenz_mod
    IMPLICIT none
CONTAINS

    SUBROUTINE lorenz_rhs(x, y, z, sigma, rho, beta, dx, dy, dz)
        IMPLICIT none
        REAL, intent(in)  :: x, y, z, sigma, rho, beta
        REAL, intent(out) :: dx, dy, dz

        dx = sigma * (y - x)
        dy = x * (rho - z) - y
        dz = (x*y) - (beta * z)

    END SUBROUTINE lorenz_rhs


END MODULE lorenz_mod