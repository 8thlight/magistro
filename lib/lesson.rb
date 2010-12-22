require "directory_reader"
require "chapter"
require "exercise"

class Lesson
  attr_accessor :path, :options, :reade
  
  def initialize(path, options = {})
    @path = path
    @reader = DirectoryReader.new
    @options = options
  end
  
  def exercises
    return @reader.collection([@path], Exercise, {:parent => self, :reader => @reader, :magistro_root => @options[:magistro_root]})
  end
  
  def name
    return @reader.read([@path, "name"])
  end
  
  def chapter
    return Chapter.new("chapter", {:reader => @reader, :parent => self})
  end
end