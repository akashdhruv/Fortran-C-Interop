BASEDIR = $(PWD)

CC = g++
FF = gfortran

all:
	$(CC) -c Orchestration/OrchestrationMain/cxx-source/orchestration.cpp \
	-I$(BASEDIR)/Orchestration/OrchestrationMain/cxx-source
	
	$(CC) -c Orchestration/OrchestrationMain/orchestration_fi.cpp \
	-I$(BASEDIR)/Orchestration/OrchestrationMain/cxx-source
	
	$(FF) -c Orchestration/OrchestrationMain/orchestration_base_mod.F90 -I$(BASEDIR)
	
	$(FF) -c Orchestration/OrchestrationMain/orchestration_mod.F90 -I$(BASEDIR)
	
	$(FF) -c Orchestration/Orchestration_data.F90 -I$(BASEDIR)
	
	$(FF) -c Orchestration/Orchestration_init.F90 -I$(BASEDIR)
	
	$(FF) -c Orchestration/Orchestration_finalize.F90 -I$(BASEDIR)
	
	$(FF) -c Orchestration/Orchestration_interface.F90 -I$(BASEDIR)
	
	$(FF) -c Orchestration/OrchestrationMain/Orchestration_operation.F90 -I$(BASEDIR)
	
	$(FF) -c Flash.F90
	
	$(FF) -o flash Flash.o \
	Orchestration_init.o \
	Orchestration_data.o \
	Orchestration_finalize.o \
	Orchestration_operation.o \
	orchestration_base_mod.o \
	orchestration_mod.o \
	orchestration_fi.o \
	orchestration.o -lstdc++
	
clean:
	rm *.o
	rm *.mod
	rm flash
