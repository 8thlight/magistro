require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "directory_reader"

class TestReader
  def initialize(entry, options = {})    
  end
end

describe DirectoryReader do

  before do
    @directory = File.expand_path("./test")
    Dir.mkdir(@directory)
    
    @sub_directory = File.expand_path("./test/test")
    Dir.mkdir(@sub_directory)
    
    @filename = File.expand_path("./test.file")
    File.open(@filename, "w") {|file| file.write("contents")}
  end
  
  after do
    File.delete(@filename) if File.exists?(@filename)
    File.delete(@sub_directory) if File.exists?(@sub_directory)
    File.delete(@directory) if File.exists?(@directory)
  end
  
  it "reads a file" do
    DirectoryReader.new(@directory).read(@filename).should == "contents"
  end
  
  it "reads from an array" do
    DirectoryReader.new(@directory).read([File.expand_path("./"), "test.file"]).should == "contents"
  end
  
  it "returns a collection of directories" do
    collection = DirectoryReader.new(@directory).collection(@directory, 1, TestReader, {})
    collection.size.should == 1
  end
  
end
