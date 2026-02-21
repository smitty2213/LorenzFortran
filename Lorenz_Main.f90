PROGRAM LorenzEquationsMain
! Purpose: 
! This code is desinged to analyze the chaotic nature of the Lorenz System using the Runge-Kutta 4 
! to anaylize the differential equtions. The Lorenz System is a set of three ordinary differential equations,
! originaly developed to analyze atmospheric convection. It can show chaotic behvoir under certain conditions.
! Chaotic behavior means the output is highley sensitive to small changes to the inital conditions.
!
! The three equations:
! dx/dt = sigma(y - x)
! dy/dt = x(rho - z) - y
! dz/dt = xy - beta * z
!
! Parameters:
!   sigma : Prandtl number, 
!   rho   : Rayleigh number
!   beta  : relates to the physical dimensions of the fluid layer itself
!
! We are interested in looking at the dwell time characteristics of the Lorenz System, such as 
! the survivability and the effect that the dwell times has on the next dwell time. In order to 
! anayze these characteristics this progam is desinged to output data to a CSV file to be read from
! in python. We create the data in Fortran code and anaylze/plt graphs using python. 
!
! This is the Lorenz_Main file is responsible for:
!   1. Reading parameters and inital conditions from an input file
!   2. Running the RK4 loop from inital time to final time
!   3. Writing (t, x, y, z) to a CSV for be processed by code in Python
!
! History:
!        Version            Programmer          Start Date          Completed Date          Description
!        -------            ----------          ----------          --------------          ---------------------
!           1               Nicolas Smith        02/20/26                                   Creating code from scratch, setup the Runge-Kutta 4 to anaylze the
!                                                                                           Lornez System and output the data to a CSV file.            

    IMPLICIT none

! State of the system variables
    REAL :: x, y, z         ! Current position of the system  
    REAL :: x0, y0, z0      ! Inital positions
    REAL :: t, t0, tf       ! Current time, initial time, final time
! Lorenz Parameters
    REAL :: sigma           ! Prandtly number
    REAL :: rho             ! Rayleigh Number
    REAL :: beta            ! Relates to the physical dimensions of the fluid layer itself
! Step Size
    INTEGER :: nsteps       ! Numbrt of steps to take
    REAL :: step_size       ! Size of each step
! Loop Control
    INTEGER :: rk4_index    ! Used to loop index for RK4
! Declare Inital Conditions
    x0 = 1.0        ! Inital x position
    y0 = 1.0        ! Inital y position
    z0 = 1.0        ! Inital z position

    t0 = 0          ! Inital time
    tf = 200        ! Final time
    step_size = 0.1 ! Size of each step
    nsteps = INT((tf - t0) / step_size)         ! Number of steps to take

    sigma = 10.0
    rho = 28.0
    beta = 8.0/3.0

    x = x0
    y = y0 
    z = z0
    t = t0

! RK4_Loop is used to update the state of the system and output the updates to a CSV file
    RK4_Loop: DO rk4_index = 0, nsteps

    END DO RK4_Loop

    
END PROGRAM LorenzEquationsMain
