require "directory_model"
require "utils/file_io"
require "step"
require "traverse"

class Exercise < DirectoryModel
  include Traverse::Directory
  
  readable_attribute :name

  def steps
    return collect(@directory, Step)
  end
  
  #TODO - PWP - have traverse take a block rather than doing this O(2X)
  def next(current_step)
    steps.each_with_index do |step_candidate, index|
      return steps[index + 1] if current_step.directory == step_candidate.directory && index < steps.size - 1
    end
    return nil
  end
  
  def previous(step)
    steps.each_with_index do |step_candidate, index|
      return steps[index - 1] if step.directory == step_candidate.directory && (index - 1) >= 0
    end
    return nil
  end
  
  def save_source(contents)
    Utils::FileIO.write_file(@directory, "source.rb", contents)
  end

  def source
    Utils::FileIO.read(@directory, "source.rb")
  end
  
end

