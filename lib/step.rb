require "exercise"

class Step
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
    return false unless exercise.path == other.exercise.path 
    return true
  end
  
  def instructions
    return @reader.read([exercise.lesson.path, exercise.path, @path, "instructions"])
  end
  
  def spec
    return @reader.read([exercise.lesson.path, exercise.path, @path, "spec"])
  end

end