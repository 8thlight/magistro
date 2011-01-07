require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require "step"

describe "Changes background on pass/fail" do

  before {on_first_step}
  
  uses_limelight :scene => "exercises", :hidden => true
  
  it "sets the output to the screen" do
    Do.notify(:run_update, {:failed_count => 2, :scene => scene, :step => @step})
    
    scene.find("failure_count").text.should == "2 failure"
  end
  
  it "sets the output to the screen" do
    Do.notify(:run_update, {:failed_count => 0, :scene => scene, :step => @step})
    scene.find("failure_count").text.should == "0 failure"
  end

  it "sets the output to the tests output" do
    Do.notify(:run_update, {:failed_count => 0, :scene => scene, :step => @step, :output => "put"})
    scene.find("output").text.should == "put"    
  end

  
end