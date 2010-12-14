require "utils/file_io"
require "exercise"
class Step
  attr_reader :directory
  def initialize(options = {})
    @directory = File.expand_path(options[:directory])
  end
  
  def exercise
    return Exercise.new(File.expand_path(File.join(@directory, "../")))
  end

  def instructions
    return Utils::FileIO.read(@directory, "instructions")
  end

  def spec_filename
    files = Dir.glob(File.join(@directory, "*_spec.rb"))
    return files.first
  end

  def spec
    Utils::FileIO.read(@directory, File.basename(spec_filename))
  end

end