require "directory_model"
require "exercise"

class Step < DirectoryModel
  readable_attribute :instructions, :spec
  
  def exercise
    return Exercise.new(File.expand_path(File.join(@directory, "../")))
  end  

end