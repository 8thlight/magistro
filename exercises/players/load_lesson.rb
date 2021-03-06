require "lesson"
require "exercise"
require "directory_chooser"
require "reader_factory"

on_mouse_clicked do
  directory = DirectoryChooser.new.ask_chooser("Enter Lesson Directory")
  if directory
    reader = ReaderFactory.create(directory)
    production.current_lesson = Lesson.new(reader.lesson_path, :magistro_root => production.magistro_root, :reader => reader)
    exercise = production.current_lesson.exercises.first
    production.current_exercise = exercise
    if reader.class != NullReader
      options = {:scene => scene, :step => exercise.steps.first} 
      Do.notify(:load_step, options)
      Do.notify(:run, options)
    end
    
  end
end