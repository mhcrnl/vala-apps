namespace Dlauncher {
public class Model: GLib.Object {
    public void add_item_to_iconview(string icon, string name, string? comment,
                                     string exec) {
        Gdk.Pixbuf pix = null;
        var icon_theme = Gtk.IconTheme.get_default();
        try {
            pix = icon_theme.load_icon(icon, 64,
                                       Gtk.IconLookupFlags.FORCE_SIZE); // from icon theme
        } catch (GLib.Error e) {
            try {
                pix = icon_theme.load_icon("application-x-executable", 64,
                                           Gtk.IconLookupFlags.FORCE_SIZE); // fallback
            } catch (GLib.Error e) {
                stderr.printf ("%s\n", e.message);
            }
        }
        liststore.append(out iter);
        liststore.set(iter, 0, pix, 1, name, 2, comment, 3, exec);
    }

    public void exec_selected() {
        List<Gtk.TreePath> paths = view.get_selected_items();
        GLib.Value exec;
        foreach (Gtk.TreePath path in paths) {
            liststore.get_iter(out iter, path);
            liststore.get_value(iter, 3, out exec);
            spawn_command((string)exec);
        }
    }

    public void spawn_command(string item) {
        try {
            Process.spawn_command_line_async(item);
        } catch (GLib.Error e) {
            stderr.printf ("%s\n", e.message);
        }
    }

}
}
