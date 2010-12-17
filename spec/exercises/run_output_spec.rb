require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "step"

describe "Changes background on pass/fail" do

  before do 
    @step_directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/1")
    @step = Step.new(@step_directory)
    production.current_step = @step
  end
  
  uses_limelight :scene => "exercises", :hidden => true
  
  it "sets the output to the screen" do
    Observer.notify(:run_update, {:failed_count => 2, :scene => scene, :step => @step})
    
    scene.find("failure_count").text.should == "2 failure"
  end
  
  it "sets the output to the screen" do
    Observer.notify(:run_update, {:failed_count => 0, :scene => scene, :step => @step})
    scene.find("failure_count").text.should == "0 failure"
  end

  it "sets the output to the tests output" do
    Observer.notify(:run_update, {:failed_count => 0, :scene => scene, :step => @step, :output => "put"})
    scene.find("output").text.should == "put"    
  end

  
end