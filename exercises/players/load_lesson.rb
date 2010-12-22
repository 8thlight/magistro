require "lesson"
require "exercise"
require "directory_chooser"

on_mouse_clicked do
  directory = DirectoryChooser.new.ask_chooser("Enter Lesson Directory")
  if directory
    production.current_lesson = Lesson.new(directory, :magistro_root => production.magistro_root)
    exercise = production.current_lesson.exercises.first
    production.current_exercise = exercise
    
    options = {:scene => scene, :step => exercise.steps.first}
    Observer.notify(:load_step, options)
  end
end
