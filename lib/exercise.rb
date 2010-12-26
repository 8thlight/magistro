require "step_navigation"
require "step"

class Exercise
  include StepNavigation
  attr_accessor :path, :reader
  
  def initialize(path, options = {})
    @parent = options[:parent]
    @reader = options[:reader]
    @magistro_root = options[:magistro_root]
    @path = path
  end
  
  def steps
    return @reader.collection([lesson.path, @path], 3, Step, {:reader => @reader, :parent => self})
  end
  
  def lesson
    return @parent
  end
  
  def save_source(contents)
    create_folder([@magistro_root])
    create_folder([@magistro_root, lesson.name])
    create_folder(source_path)
    filename = File.join(source_path, "source")
    File.delete(filename) if File.exist?(filename)
    File.open(filename, 'a') {|file| file.write(contents)}
  end

  def source
    return File.read(File.join(source_path, "source"))
  end
  
  def name
    return @reader.read([lesson.path, @path, "name"])
  end
  
  private #############
  
  def source_path
    return [@magistro_root, lesson.name, @path]
  end
  
  def create_folder(path)
    Dir.mkdir(File.expand_path(File.join(path))) unless File.exists?(File.join(path))
  end
  
  
end

