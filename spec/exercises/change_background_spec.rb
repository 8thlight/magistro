require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "step"

describe "Changes background on pass/fail" do

  uses_limelight :scene => "exercises", :hidden => true
  before { on_first_step }
  
  it "sets the background to green if there are no failures" do    
    Observer.notify(:run_update, {:failed_count => 0, :scene => scene, :step => @step})

    tests = scene.find("tests")
    tests.style.background_color.should == "#335003ff"
    tests.style.secondary_background_color.should ==  "#618108ff"
  end
  
  it "sets the background to green if there are no failures" do
    Observer.notify(:run_update, {:failed_count => 2, :scene => scene, :step => @step})

    tests = scene.find("tests")
    tests.style.background_color.should == "#ff0300ff"
    tests.style.secondary_background_color.should ==  "#b1212bff"
  end
  
  
end