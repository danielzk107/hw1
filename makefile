start: basicClassification.o advancedClassificationLoop.o advancedClassificationRecursion.o maindrec.o
	make basicClassification.o
	make maindrec.o
	make main.o
	make advancedClassificationLoop.o
	make advancedClassificationRecursion.o
basicClassification.o: basicClassification.c
	gcc -Wall -c basicClassification.c
maindrec.o:maindrec.c
	gcc -Wall -c maindrec.c
main.o:main.c
	gcc -Wall -c main.c
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
	#ifndef _basicClassification_o
		make basicClassification.o
	#endif
	#ifndef _advancedClassificationLoop_o
		make advancedClassificationLoop.o
	#endif
	ar rc libclassloops.a basicClassification.o advancedClassificationLoop.o NumClass.h
	ranlib libclassloops.a
recursives:
	#ifndef _basicClassification_o
		make basicClassification.o
	#endif
	#ifndef _advancedClassificationRecursion_o
		make advancedClassificationRecursion.o
	#endif
	ar rc libclassrec.a basicClassification.o advancedClassificationRecursion.o
	ranlib libclassrec.a
recursived:
	#ifndef _basicClassification_o
		make basicClassification.o
	#endif
	#ifndef _advancedClassificationRecursion_o
		make advancedClassificationRecursion.o
	#endif
	gcc -shared basicClassification.o advancedClassificationRecursion.o -o libclassrec.so
loopd:
	#ifndef _basicClassification_o
		make basicClassification.o
	#endif
	#ifndef _advancedClassificationLoop_o
		make advancedClassificationLoop.o
	#endif
	gcc -shared basicClassification.o advancedClassificationLoop.o -o libclassloops.so
mains:
	#ifndef _basicClassification_o
		make basicClassification.o
	#endif
	#ifndef _advancedClassificationRecursion_o
		make advancedClassificationRecursion.o
	#endif
	#ifndef _maindrec_o
		make maindrec.o
	#endif
	gcc maindrec.o basicClassification.o advancedClassificationRecursion.o NumClass.h -L libclassrec.a -o mains
maindrec:
	#ifndef _basicClassification_o
		make basicClassification.o
	#endif
	#ifndef _advancedClassificationRecursion_o
		make advancedClassificationRecursion.o
	#endif
	#ifndef _maindrec_o
		make maindrec.o
	#endif
	gcc -shared basicClassification.o advancedClassificationRecursion.o -o libclassrec.so
	gcc maindrec.o basicClassification.o advancedClassificationRecursion.o NumClass.h -L libclassrec.so -o maindrec
maindloop:
	#ifndef _basicClassification_o
		make basicClassification.o
	#endif
	#ifndef _advancedClassificationLoop_o
		make advancedClassificationLoop.o
	#endif
	#ifndef _main_o
		make main.o
	#endif
	gcc -shared basicClassification.o advancedClassificationLoop.o -o libclassloops.so
	gcc main.o basicClassification.o advancedClassificationLoop.o NumClass.h -L libclassloops.so -o maindloop
all:
	make loops
	make recursives
	make recursived
	make loopd
	make mains
	make maindrec
	make maindloop
