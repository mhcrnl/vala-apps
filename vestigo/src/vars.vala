namespace Vestigo {
const string NAME        = "Vestigo";
const string VERSION     = "0.0.5";
const string DESCRIPTION = _("A GTK3 file manager");
const string ICON        = "system-file-manager";
const string[] AUTHORS   = { "Simargl <https://github.com/simargl>", null };

Gtk.ApplicationWindow window;
Gtk.IconView view;
Gtk.ListStore model;
Gtk.Menu menu;
Gtk.PlacesSidebar places;
Gtk.TreeIter iter;
GLib.FileMonitor current_monitor;
GLib.TimeoutSource time;
GLib.MainLoop loop;

int width;
int height;
int icon_size;
int thumbnail_size;
string saved_dir;
string terminal;

string current_dir;
GLib.List<string> history;
GLib.List<string> files_copy;
GLib.List<string> files_cut;
}
