start: basicClassification.o advancedClassificationLoop.o advancedClassificationRecursion.o maindrec.o
	make basicClassification.o
	make maindrec.o
	make main.o
	make advancedClassificationLoop.o
	make advancedClassificationRecursion.o
basicClassification.o: basicClassification.c
	#ifndef _basicClassification_o
	gcc -Wall -c basicClassification.c
	#endif
maindrec.o:maindrec.c
	#ifndef _maindrec_o
	gcc -Wall -c maindrec.c NumClass.h
	#endif
main.o:main.c
	#ifndef _main_o
	gcc -Wall -c main.c NumClass.h
	#endif
advancedClassificationLoop.o: advancedClassificationLoop.c
	#ifndef _advancedClassificationLoop_
	gcc -Wall -c advancedClassificationLoop.c
	#ifndef
advancedClassificationRecursion.o: advancedClassificationRecursion.c
	#ifndef _advancedClassificationRecursion_o
	gcc -Wall -c advancedClassificationRecursion.c
	#endif
clean: 
	rm *.o 
	rm -f *.a
	rm -f mains
	rm -f *.so
	rm -f maindrec
	rm -f maindloop
loops: 
	make basicClassification.o
	make advancedClassificationLoop.o
	ar rc libclassloops.a basicClassification.o advancedClassificationLoop.o NumClass.h
	ranlib libclassloops.a
recursives:
	make basicClassification.o 
	make advancedClassificationRecursion.o
	ar rc libclassrec.a basicClassification.o advancedClassificationRecursion.o
	ranlib libclassrec.a
recursived:
	make basicClassification.o
	make advancedClassificationRecursion.o
	gcc -shared basicClassification.o advancedClassificationRecursion.o -o libclassrec.so
loopd:
	make basicClassification.o
	make advancedClassificationLoop.o
	gcc -shared basicClassification.o advancedClassificationLoop.o -o libclassloops.so
mains:
	make maindrec.o
	make basicClassification.o
	make advancedClassificationRecursion.o
	gcc maindrec.o basicClassification.o advancedClassificationRecursion.o NumClass.h -L libclassrec.a -o mains
maindrec:
	make basicClassification.o
	make advancedClassificationRecursion.o
	make maindrec.o
	gcc -shared basicClassification.o advancedClassificationRecursion.o -o libclassrec.so
	gcc maindrec.o basicClassification.o advancedClassificationRecursion.o NumClass.h -L libclassrec.so -o maindrec
maindloop:
	make basicClassification.o
	make advancedClassificationLoop.o
	make main.o
	gcc -shared basicClassification.o advancedClassificationLoop.o -o libclassloops.so
	gcc main.o basicClassification.o advancedClassificationLoop.o NumClass.h -L libclassloops.so -o maindloop
all:
	make
	make loops
	make recursives
	make recursived
	make loopd
	make mains
	make maindrec
	make maindloop
