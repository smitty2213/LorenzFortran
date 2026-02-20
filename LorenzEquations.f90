PROGRAM LorenzEquations
! Purpose: 
! This code is desinged to analyze the chaotic nature of the Lorenz System using the Runge-Kutta 4 
! to anaylize the differential equtions. The Lorenz System is a set of three ordinary differential equations,
! originaly developed to analyze atmospheric convection. It can show chaotic behvoir under certain conditions.
! Chaotic behavior means the output is highley sensitive to small changes to the inital conditions.
!
! The three equations:
! dx/dt = sigma(y - x)
! dy/dt = x(p - z) - y
! dz/dt = xy - Bz
!
! sigma, p, and B are parameters representing physical properties of the system.
! sigma is the Prandtl number, p the Rayleigh number, and B relates to the physical dimensions
! of the fluid layer itself.
!
! We are interested in looking at the dwell time characteristics of the Lorenz System, such as 
! the survivability and the effect that the dwell times has on the next dwell time. In order to 
! anayze these characteristics this progam is desinged to output data to a CSV file to be read from
! in python. We create the data in Fortran code and anaylze/plt graphs using python. 
!
! History:
!        Version            Programmer          Start Date          Completed Date          Description
!        -------            ----------          ----------          --------------          ---------------------
!           1               Nicolas Smith        02/20/26                                   Creating code from scratch, setup the Runge-Kutta 4 to anaylze the
!                                                                                           Lornez System and output the data to a CSV file.            

    IMPLICIT none
    
END PROGRAM LorenzEquations