require "exercise"
require "directory_chooser"

on_mouse_clicked do
  directory = DirectoryChooser.new.ask_chooser("Enter Lesson Directory")
  if directory
    exercise = Exercise.new(directory)
    scene.find("test_source").text = exercise.steps[0].spec
    scene.find("instructions").text = exercise.steps[0].instructions
    production.current_exercise = exercise
    production.current_step = production.current_exercise.steps.first
  end
end
