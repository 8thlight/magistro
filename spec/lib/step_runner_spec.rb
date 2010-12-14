require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "step_runner"

describe StepRunner do

  before do
    @directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/1")
    @step = Step.new(:directory => @directory)
    @step.save_source("class Base;end;")
    @step_runner = StepRunner.new(@step)
  end

  it "has the source loaded from the step" do
    @step_runner.run
    @step_runner.test_space::Base.new.should_not be_nil
  end

  # it "creates the example group" do
  #   @step_runner.run
  #   @step_runner.test_space.description_block.should_not be_nil
  # end

  # it "sets the output and error streams" do
  #   @step_runner.run
  #   @step_runner.output.should_not be_nil
  #   @step_runner.errors.should_not be_nil
  # end
  
  # it "dumps the failure" do
  #   @step_runner.run
  #   @step_runner.output.should == ""    
  # end
  
  # it "returns the failed count" do
  #   example = mock("example")
  #   @step_runner.formatter.failed_examples << example
  #   @step_runner.failed_count.should == 1
  # end  

end
