clean:
	rm -f schemas/gschemas.compiled
	rm -f noannoyance-fork@vrba.dev.shell-extension.zip

schemas:
	glib-compile-schemas schemas/

install: clean schemas
	gnome-extensions pack
	gnome-extensions install noannoyance-fork@vrba.dev.shell-extension.zip --force
	gnome-extensions enable noannoyance-fork@vrba.dev

test_live: install
	dbus-run-session -- gnome-shell --nested --wayland

test_prefs: install
	gnome-extensions prefs noannoyance-fork@vrba.dev

.PHONY: clean install test_live test_prefs schemas
