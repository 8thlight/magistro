require "directory_model"
require "step_navigation"
require "step"

class Exercise < DirectoryModel
  include StepNavigation
  
  attr_accessor :path
  
  def initialize(filename, options = {})
    @parent = options[:parent]
    @path = filename
    @directory = File.expand_path(File.join(lesson.path, filename))
    @reader = options[:reader]
  end
  
  def steps
    return @reader.collection([lesson.path, @path], Step, @reader, self)
  end
  
  def lesson
    return @parent
  end
  
  def save_source(contents)
    create_folder([magistro_folder])
    create_folder([magistro_folder, lesson.name])
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
    return [magistro_folder, lesson.name, @path]
  end
  
  def magistro_folder
    return File.expand_path("~/.magistro")
  end
  
  def create_folder(path)
    Dir.mkdir(File.expand_path(File.join(path))) unless File.exists?(File.join(path))
  end
  
  
end

