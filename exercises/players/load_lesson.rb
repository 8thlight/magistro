require "exercise"
require "directory_chooser"

on_mouse_clicked do
  directory = DirectoryChooser.new.ask_chooser("Enter Lesson Directory")
  if directory
    exercise = Exercise.load_from(directory)
    scene.find("test_source").text = exercise.steps[0].spec
    scene.find("instructions").text = exercise.steps[0].instructions
    production.current_exercise = exercise
  end
end
