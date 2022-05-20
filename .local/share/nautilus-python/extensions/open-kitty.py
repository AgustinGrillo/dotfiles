import os

from gi.repository import Nautilus, GObject

class ColumnExtension(GObject.GObject, Nautilus.MenuProvider):
    def __init__(self):
        pass
    def menu_activate_cb(self, menu, file):
        os.system("~/.local/bin/kitty --working-directory " + file.get_location().get_path() + "&")

    def get_background_items(self, window, file):
        item = Nautilus.MenuItem(name='NautilusOpenKitty', 
                                         label='Open in Kitty', 
                                         tip='',
                                         icon='')
        item.connect('activate', self.menu_activate_cb, file)
        return item,