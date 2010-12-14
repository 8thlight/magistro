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
    Dir.entries(@directory).each do |entry|
      filename = File.join(@directory, entry)
      steps << Step.new(:directory => filename) if File.directory?(filename) && ![".", ".."].include?(entry)
    end
    return steps
  end
  
  def save_source(contents)
    Utils::FileIO.write_file(@directory, "source.rb", contents)
  end

  def source
    Utils::FileIO.read(@directory, "source.rb")
  end
  
  
end

