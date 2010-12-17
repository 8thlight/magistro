require "utils/file_io"

class DirectoryModel
  attr_reader :directory
  def initialize(directory)
    @directory = File.expand_path(directory)
    raise "#{directory} is not valid." unless File.exist?(directory)
  end

  def ==(other)
    return @directory == other.directory
  end
  
  def self.readable_attribute(*names)
    names.each do |name|
      module_eval("def #{name};Utils::FileIO.read(@directory, \"#{name}\");end;") 
    end
  end
  
  def self.modified_attribute(name, method, arg)
    module_eval("def #{name};Utils::FileIO.read(@directory, \"#{name}\").send(:#{method}, \"#{arg}\");end;")
  end
end