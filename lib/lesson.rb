require "directory_model"
require "chapter"
require "exercise"
require "traverse"

class Lesson < DirectoryModel
  include Traverse::Directory
  
  def exercises
    return collect(@directory, Exercise)
  end
  
  def chapter
    return Chapter.new(File.join(@directory, "chapter"))
  end
end