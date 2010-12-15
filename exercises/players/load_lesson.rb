require "exercise"
require "directory_chooser"

on_mouse_clicked do
  directory = DirectoryChooser.new.ask_chooser("Enter Lesson Directory")
  if directory
    exercise = Exercise.new(directory)
    production.current_exercise = exercise
    
    options = {:scene => scene, :step => exercise.steps.first}
    Observer.notify(:load_step, options)
  end
end
