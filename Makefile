# On Mac OSX gcc is required as clang complains bitterly about the old style
# C delarations used.

CFLAGS=-O2
# The following flag is required to compile in Fedora (and probably other RHELish flavours).
YACC=bison -y
DEP=zmac.o mio.o doc.o zi80dis.o

zmac: doc.inl $(DEP)
	$(CXX) -Wall $(CXXFLAGS) -o zmac $(DEP)

doc.inl: doc.c doc.txt
	$(CC) -Wall -DMK_DOC -o doc doc.c
	./doc >/dev/null

clean:
	rm -f zmac zmac.c doc.inl $(DEP)
