FC = gfortran
FFLAGS = -O3 -Wall

OBJ = lorenz_mod.o rk4_mod.o Lorenz_Main.o

app: $(OBJ)
	$(FC) $(OBJ) -o app

%.o: %.f90
	$(FC) $(FFLAGS) -c $<

clean: 
	rm -f *.o *.mod app