require "directory_model"

class Chapter < DirectoryModel
  attr_accessor :path
  def initialize(path, options = {})
    @path = path
    @reader = options[:reader]
    @parent = options[:parent]
  end
  
  def title
    return @reader.read([@parent.path, @path, "title"])
  end
  
  def contents
    return @reader.read([@parent.path, @path, "contents"])
  end
  
  def resources
    return @reader.read([@parent.path, @path, "resources"]).split("\n")
  end
  
end