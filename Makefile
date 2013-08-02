clean:
	rm *.o *_.c

hello:
	gsc -exe hello.scm
#m3 example from the gambit texinfo docs
hello-mingw:
	/usr/local/Gambit-C/bin/gsc.exe -c hello.scm
	/usr/local/Gambit-C/bin/gsc.exe -link hello.c
	i686-w64-mingw32-gcc -I  /usr/local/Gambit-C/include/ -L/usr/local/Gambit-C/lib hello.c hello_.c  -lgambc -lws2_32 -lwsock32  -o hello-mingw

m3:
	gsc -c m2.scm        # create m2.c (note: .scm is optional)
	gsc -c m3.scm        # create m3.c (note: .scm is optional)
	gsc -link m2.c m3.c  # create the incremental link file m3_.c
	gsc -obj m1.c m2.c m3.c m3_.c
	gcc m1.o m2.o m3.o m3_.o -lgambc -lm -ldl -lutil -o m3

m3-mingw:
	/home/joakim/build_pristine/gambit/gsc/gsc.exe -c m2.scm        # create m2.c (note: .scm is optional)
	/home/joakim/build_pristine/gambit/gsc/gsc.exe -c m3.scm        # create m3.c (note: .scm is optional)
	/home/joakim/build_pristine/gambit/gsc/gsc.exe -link m2.c m3.c  # create the incremental link file m3_.c
	i686-w64-mingw32-gcc -I  /usr/local/Gambit-C/include/ -L/usr/local/Gambit-C/lib m1.c m2.c m3.c m3_.c  -lgambc -lws2_32 -lwsock32  -o m3-mingw

tst-mingw:
	i686-w64-mingw32-gcc tst-mingw.c -o tst-mingw
