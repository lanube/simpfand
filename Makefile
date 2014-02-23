VERSION = $(shell git describe)

CC = gcc
CPPFLAGS = -DSIMPFAND_VERSION=\"$(VERSION)\"
CFLAGS = -std=c99 -Wall -pedantic -Os

SRC = simpfand.c parse.c options.c
OBJ = $(SRC:.c=.o)

simpfand: $(OBJ)

strip: simpfand
	strip --strip-all simpfand

install: simpfand
	install -D -m755 simpfand $(DESTDIR)$(PREFIX)/bin/simpfand
	install -D -m644 simpfand.conf $(DESTDIR)$(PREFIX)/share/doc/simpfand/simpfand.conf
	install -D -m755 restart-simpfand.sh $(DESTDIR)$(PREFIX)/lib/systemd/system-sleep/restart-simpfand.sh

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/simpfand
	rm -f $(DESTDIR)$(PREFIX)/share/doc/simpfand/simpfand.conf
	rm -f $(DESTDIR)$(PREFIX)/lib/systemd/system-sleep/restart-simpfand.sh

clean:
	rm -f *.o simpfand

.PHONY: install uninstall clean
