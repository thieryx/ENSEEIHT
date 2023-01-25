# Ceci est un commentaire pour introdure la variable CC qui comporte le nom du compilateur utilisé :
CC=c99
# Les variables CFLAGS et LDFLAGS comportent les options de compilation et d'édition des liens :
CFLAGS=-Wextra -pedantic -c
LDFLAGS= -o

all: ephemeride EDT

ephemeride: date.o ephemeride.o
	$(CC) $^ $(LDFLAGS) $@

EDT: cours.o salle.o date.o enseignant.o EDT.o
	$(CC) $^ $(LDFLAGS) $@

clean:
	rm *.o ephemeride
	
depend:
	    makedepend *.c -Y.

	# DO NOT DELETE

cours.o: cours.h salle.h date.h enseignant.h
date.o: date.h
EDT.o: cours.h salle.h date.h enseignant.h
enseignant.o: enseignant.h date.h
ephemeride.o: date.h
salle.o: salle.h date.h
.PHONY: clean all
