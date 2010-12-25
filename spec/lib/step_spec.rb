require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "step"

describe Step do

  before do
    on_first_step
    @spec_filename = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/1", "spec")
  end
  
  it "has a spec contents" do
    @step.spec.should == File.read(@spec_filename)
  end

  it "has instructions" do
    @step.instructions.should == "First we need to create a base class"
  end
  
  it "knows its exercise" do
    @step.exercise.should == @exercise
  end
  
  it "is equal" do
    same_step = Step.new("1", :parent => @exercise)
    @step.should == same_step
  end
  
  it "knows its position" do
    @exercise.steps.first.position.should == 1
    @exercise.steps.last.position.should == 2 
  end
  
end
