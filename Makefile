PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
DATADIR ?= $(PREFIX)/share
UDEVDIR ?= /etc/udev/rules.d

all:
	@echo "Nothing to compile. Run 'sudo make install' to install the scripts."

install:
	install -d $(DESTDIR)$(BINDIR)
	install -m 755 src/asus-rgb-control $(DESTDIR)$(BINDIR)/
	install -m 755 src/asus-rgb-cycle $(DESTDIR)$(BINDIR)/
	install -m 755 src/asus-rgb-setup $(DESTDIR)$(BINDIR)/
	
	install -d $(DESTDIR)$(DATADIR)/applications
	install -m 644 data/asus-rgb-setup.desktop $(DESTDIR)$(DATADIR)/applications/
	
	install -d $(DESTDIR)$(UDEVDIR)
	install -m 644 data/99-rogauracore.rules $(DESTDIR)$(UDEVDIR)/

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/asus-rgb-control
	rm -f $(DESTDIR)$(BINDIR)/asus-rgb-cycle
	rm -f $(DESTDIR)$(BINDIR)/asus-rgb-setup
	rm -f $(DESTDIR)$(DATADIR)/applications/asus-rgb-setup.desktop
	rm -f $(DESTDIR)$(UDEVDIR)/99-rogauracore.rules
