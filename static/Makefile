LIBBB	= libbb.a
LIBCC	= libcc.a

run: aa
	./aa ; echo $$?

ldd: aa $(LIBBB) $(LIBCC)
	#Error expected on lib*.a. Ignore it.
	-ldd $^

aa: aa.o $(LIBBB) $(LIBCC)
	$(CC) $(LDFLAGS) -o $@ $< -lbb -lcc

lib%.a: %.o
	$(AR) r $@ $^

clean: .PHONY
	$(RM) $(wildcard lib*.a) $(wildcard *.o) aa
