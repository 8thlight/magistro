require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "jar_reader"

describe JarReader do
  
  before do
    @filename = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/lessons/template_method.jar"))
    @reader = JarReader.new(@filename)
  end
  
  it "reads" do
    @reader.read(["template_method", "name"]).should == "Template Method\n"
  end
  
  it "reads deaper file" do
    @reader.read(["template_method", "1_simple", "1", "instructions"]).should == "First we need to create a base class\n"
  end
  
  it "collection" do
    collection = @reader.collection("template_method", 1, Exercise, {})
    collection.size.should == 2
  end
end
