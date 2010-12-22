require "directory_model"
require "chapter"
require "exercise"

class Lesson < DirectoryModel
  attr_accessor :path
  
  def initialize(path, options = {})
    @path = path
    @reader = DirectoryReader.new(@path)
  end
  
  def exercises
    return @reader.collection([@path], Exercise, @reader, self)
  end
  
  def name
    return @reader.read([@path, "name"])
  end
  
  def chapter
    return Chapter.new("chapter", {:reader => @reader, :parent => self})
  end
end