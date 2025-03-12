clean:
	rm -f schemas/gschemas.compiled
	rm -f noannoyance@n00b42.shell-extension.zip

schemas:
	glib-compile-schemas schemas/

install: clean schemas
	gnome-extensions pack
	gnome-extensions install noannoyance@n00b42.shell-extension.zip --force
	gnome-extensions enable noannoyance@n00b42

test_live: install
	dbus-run-session -- gnome-shell --nested --wayland

test_prefs: install
	gnome-extensions prefs noannoyance@n00b42

.PHONY: clean install test_live test_prefs schemas
