require "browser"

on_mouse_clicked do
  Browser.show_in_browser(self.id)
end