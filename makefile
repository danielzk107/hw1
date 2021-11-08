start: basicClassification.o advancedClassificationLoop.o advancedClassificationRecursion.o maindrec.o
	make basicClassification.o
	make maindrec.o
	make maindloop.o
	make advancedClassificationLoop.o
	make advancedClassificationRecursion.o
basicClassification.o: basicClassification.c
	gcc -Wall -c basicClassification.c
maindrec.o:maindrec.c
	gcc -Wall -c maindrec.c
maindloop.o:maindloop.c
	gcc -Wall -c maindloop.c
advancedClassificationLoop.o: advancedClassificationLoop.c
	gcc -Wall -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c
	gcc -Wall -c advancedClassificationRecursion.c
clean: 
	rm *.o 
	rm -f *.a
	rm -f mains
	rm -f *.so
	rm -f maindrec
	rm -f maindloop
loops: 
	ar rc libclassloops.a basicClassification.o advancedClassificationLoop.o Functions.h
	ranlib libclassloops.a
recursives:
	ar rc libclassrec.a basicClassification.o advancedClassificationRecursion.o
	ranlib libclassrec.a
recursived:
	gcc -shared basicClassification.o advancedClassificationRecursion.o -o libclassrec.so
loopd:
	gcc -shared basicClassification.o advancedClassificationLoop.o -o libclassloops.so
mains:
	gcc maindrec.o basicClassification.o advancedClassificationRecursion.o Functions.h -L libclassrec.a -o mains
maindrec:
	gcc -shared basicClassification.o advancedClassificationRecursion.o -o libclassrec.so
	gcc maindrec.o basicClassification.o advancedClassificationRecursion.o Functions.h -L libclassrec.so -o maindrec
maindloop:
	gcc -shared basicClassification.o advancedClassificationLoop.o -o libclassloops.so
	gcc maindloop.o basicClassification.o advancedClassificationLoop.o Functions.h -L libclassloops.so -o maindloop
all:
	make loops
	make recursives
	make recursived
	make loopd
	make mains
	make maindrec
	make maindloop
