# Author Name: James Hart
# Date: 02/15/14
# Purpose: A make file that allows easy commands for compiling.

CC = g++ # Prompts the compiler
CFLAGS = -g -Wall -Wextra # compiles with all and extra warnings.
TARGET = $(CC) $(CFLAGS) -o TARGET Employee.o Supervisor.o Officer.o main.o

# When Makefile is called with no argument, this is default executable to be created.
default: TARGET 

# When 'Makefile all' is called, it will create all the folling files in the 'all' parameter. Use 'make all'.
all: TARGET

# Executable:
TARGET: Employee.o Supervisor.o Officer.o main.o
	$(TARGET)

# Start object files:
# objects that are needed to be created from header and cpp files.

Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) -c Employee.cpp

Supervisor.o: Supervisor.cpp Supervisor.h
	$(CC) $(CFLAGS) -c Supervisor.cpp

Officer.o: Officer.cpp Officer.h
	$(CC) $(CFLAGS) -c Officer.cpp

main.o: main.cpp Employee.h Supervisor.h Officer.h
	$(CC) $(CFLAGS) -c main.cpp

# End of object files

# Removes any objects, Makefile backups, and the executable itself.
clean:
	$(RM) TARGET *.o *~
