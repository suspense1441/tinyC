assembly: tinyC libass2_19CS30011.a
	@echo "\n------------------- Generating Quads for the test files ---------------\n"

	./tinyC 1 > ass6_19CS30011_quads1.out
	./tinyC 2 > ass6_19CS30011_quads2.out
	./tinyC 3 > ass6_19CS30011_quads3.out
	./tinyC 4 > ass6_19CS30011_quads4.out
	./tinyC 5 > ass6_19CS30011_quads5.out
	./tinyC 6 > ass6_19CS30011_quads6.out

	@echo "\n-------------    Generating the object files from assembly code   ---------------\n"

	gcc -c ass6_19CS30011_1.s
	gcc -c ass6_19CS30011_2.s
	gcc -c ass6_19CS30011_3.s
	gcc -c ass6_19CS30011_4.s
	gcc -c ass6_19CS30011_5.s
	gcc -c ass6_19CS30011_6.s

	@echo "\n-------------    Compiling the test files   ---------------\n"

	gcc ass6_19CS30011_1.o -o test1 -L. -lass2_19CS30011 -no-pie
	gcc ass6_19CS30011_2.o -o test2 -L. -lass2_19CS30011 -no-pie
	gcc ass6_19CS30011_3.o -o test3 -L. -lass2_19CS30011 -no-pie
	gcc ass6_19CS30011_4.o -o test4 -L. -lass2_19CS30011 -no-pie
	gcc ass6_19CS30011_5.o -o test5 -L. -lass2_19CS30011 -no-pie
	gcc ass6_19CS30011_6.o -o test6 -L. -lass2_19CS30011 -no-pie

	@echo "\n###########  Use ./test<i> for testing the ith file  ##########\n"

libass2_19CS30011.a:
	gcc -c ass2_19CS30011.c
	ar -rcs libass2_19CS30011.a ass2_19CS30011.o

tinyC: lex.yy.o ass6_19CS30011.tab.o ass6_19CS30011_translator.o ass6_19CS30011_target_translator.o
	g++ lex.yy.o ass6_19CS30011.tab.o ass6_19CS30011_translator.o \
	ass6_19CS30011_target_translator.o -lfl -o tinyC

ass6_19CS30011_target_translator.o: ass6_19CS30011_target_translator.cxx
	g++ -c ass6_19CS30011_target_translator.cxx

ass6_19CS30011_translator.o: ass6_19CS30011_translator.cxx ass6_19CS30011_translator.h
	g++ -c ass6_19CS30011_translator.h
	g++ -c ass6_19CS30011_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

ass6_19CS30011.tab.o: ass6_19CS30011.tab.c
	g++ -c ass6_19CS30011.tab.c

lex.yy.c: ass6_19CS30011.l ass6_19CS30011.tab.h ass6_19CS30011_translator.h
	flex ass6_19CS30011.l

ass6_19CS30011.tab.c: ass6_19CS30011.y
	bison -dtv ass6_19CS30011.y -W

ass6_19CS30011.tab.h: ass6_19CS30011.y
	bison -dtv ass6_19CS30011.y -W


	
clean:
	rm lex.yy.c\
	   ass6_19CS30011.tab.c\
	   ass6_19CS30011.tab.h\
	   lex.yy.o\
	   ass6_19CS30011.tab.o\
	   ass6_19CS30011.output\
	   ass6_19CS30011_translator.o\
	   test1\
	   test2\
	   test3\
	   test4\
	   test5\
	   test6\
	   tinyC\
	   ass6_19CS30011_target_translator.o\
	   ass6_19CS30011_translator.h.gch\
	   ass6_19CS30011_quads1.out\
	   ass6_19CS30011_quads2.out\
	   ass6_19CS30011_quads3.out\
	   ass6_19CS30011_quads4.out\
	   ass6_19CS30011_quads5.out\
	   ass6_19CS30011_quads6.out\
	   libass2_19CS30011.a\
	   ass2_19CS30011.o\
	   ass6_19CS30011_1.o\
	   ass6_19CS30011_2.o\
	   ass6_19CS30011_3.o\
	   ass6_19CS30011_4.o\
	   ass6_19CS30011_5.o\
	   ass6_19CS30011_6.o\
	   ass6_19CS30011_1.s\
	   ass6_19CS30011_2.s\
	   ass6_19CS30011_3.s\
	   ass6_19CS30011_4.s\
	   ass6_19CS30011_5.s\
	   ass6_19CS30011_6.s\
