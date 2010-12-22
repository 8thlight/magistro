require "directory_model"
require "exercise"

class Step < DirectoryModel
  attr_accessor :path
  def initialize(filename, options = {})
    @path = filename
    @reader = options[:reader]
    @parent = options[:parent]
  end
  
  def position
    return @path.to_i
  end
  
  def exercise
    return @parent
  end  
  
  def ==(other)
    return false unless position == other.position
    return false unless exercise.reader.source_name == other.exercise.reader.source_name 
    return true
  end
  
  def instructions
    return @reader.read([exercise.lesson.path, exercise.path, @path, "instructions"])
  end
  
  def spec
    return @reader.read([exercise.lesson.path, exercise.path, @path, "spec"])
  end

end