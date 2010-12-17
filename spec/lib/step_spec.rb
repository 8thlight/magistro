require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "step"

describe Step do

  before do
    @directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/1")
    @spec_filename = File.expand_path(File.join(@directory, "spec"))
    @step = Step.new( @directory)
  end
  
  it "has a spec contents" do
    @step.spec.should == File.read(@spec_filename)
  end

  it "has instructions" do
    @step.instructions.should == "First we need to create a base class"
  end
  
  it "knows its exercise" do
    @step.exercise.directory.should ==  File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple"))
  end
  
  it "is equal" do
    same_step = Step.new(@directory)
    @step.should == same_step
  end
  
end
