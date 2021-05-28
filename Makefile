all:

install:
	install -Dm755 -t "$(DESTDIR)/usr/bin" cpm

uninstall:
	rm "$(DESTDIR)/cpm"
