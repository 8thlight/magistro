require "exercise"
on_mouse_clicked do
  filename = load_filename
  if filename && File.exists?(filename)
    scene.find("test_source").text = IO.read(filename) 
  end
  production.current_exercise = Exercise.new({:spec_filename => filename})
end


def load_filename
  chooser = Java::javax::swing::JFileChooser.new("JRuby panel")
  chooser.set_dialog_title("Enter filename of lesson")
  success = chooser.show_open_dialog(nil)
  if success == Java::javax::swing::JFileChooser::APPROVE_OPTION
    return chooser.get_selected_file.get_absolute_path
  end
  return nil
end