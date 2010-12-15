require "utils/file_io"
require "step"

class Exercise
  attr_accessor :directory

  def initialize(dir)
    raise "#{dir} is not a valid Exercise." unless File.exist?(dir)
    @directory = dir
  end

  def name
    return Utils::FileIO.read(@directory, "name")
  end

  def steps
    steps = []
    Dir.entries(@directory).sort.each do |entry|
      filename = File.join(@directory, entry)
      steps << Step.new(:directory => filename) if File.directory?(filename) && ![".", ".."].include?(entry)
    end
    return steps
  end
  
  #TODO - PWP - figure out a way to not traverse this list twice
  def next(step)
    steps.each_with_index do |step_candidate, index|
      return steps[index + 1] if step.directory == step_candidate.directory
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

