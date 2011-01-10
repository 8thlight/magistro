require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "null_reader"

describe NullReader do
  before do
    file = 'nothing'
    @reader = NullReader.new(file)
  end
  
  it "reads nothing" do
    reads = @reader.read('something')
    reads.should == ""
  end
  
  it "collects nothing" do
    collection = @reader.collection('path', 'depth', 'klass')
    collection.should == []
  end
  
  it "has no lesson path" do
    @reader.lesson_path.should == ""
  end
  
end