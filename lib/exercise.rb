require "step"
class Exercise
  attr_accessor :directory
  def self.load_from(dir) 
    raise "blahblah is not a valid Exercise." unless File.exist?(dir)
    return new(dir)
  end

  def initialize(dir)
    @directory = dir
  end

  def name
    return File.read(File.join(@directory, "name"))
  end

  def steps
    steps = []
    Dir.entries(@directory).each do |entry|
      filename = File.join(@directory, entry)
      steps << Step.new(:directory => filename) if File.directory?(filename) && ![".", ".."].include?(entry)
    end
    return steps
  end
end

