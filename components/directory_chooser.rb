class DirectoryChooser

  def ask_chooser(title)
    chooser = Java::javax::swing::JFileChooser.new("JRuby File Chooser")
    chooser.set_dialog_title(title)
    chooser.setFileSelectionMode(Java::javax::swing::JFileChooser::FILES_AND_DIRECTORIES)
    success = chooser.show_open_dialog(nil)
    if success == Java::javax::swing::JFileChooser::APPROVE_OPTION
      return chooser.get_selected_file.get_absolute_path
    end
    return nil
  end
end