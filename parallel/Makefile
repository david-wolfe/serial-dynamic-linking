LIBBB	= libbb.so
LIBCC	= libcc.so
CFLAGS	+= -fPIC
SOFLAGS = -shared -Wl,-soname,$@

run: aa
	env LD_LIBRARY_PATH=. ./$< ; echo $$?

ldd: aa $(LIBBB) $(LIBCC)
	env LD_LIBRARY_PATH=. ldd $^

aa: aa.o $(LIBBB) $(LIBCC)
	$(CC) $(LDFLAGS) -o $@ $< -lbb -lcc

lib%.so: %.o
	$(CC) $(LDFLAGS) $(SOFLAGS) -o $@ $^

clean: .PHONY
	$(RM) $(wildcard lib*.so*) $(wildcard *.o) aa
