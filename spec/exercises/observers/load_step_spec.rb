require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")


describe "Load step" do
  uses_limelight :scene => "exercises", :hidden => true
  before { on_first_step }
  
  it "sets the test source" do
    Do.notify(:load_step, {:scene => scene, :step => @step})
    test_source = scene.find("test_source")
    test_source.should_not be_nil
    test_source.text.should == @step.spec
  end
  
  it "sets the test source" do
    Do.notify(:load_step, {:scene => scene, :step => @step})
    test_source = scene.find("instructions")
    test_source.should_not be_nil
    test_source.text.should == @step.instructions
  end
  
  it "sets the code source for the exercise" do    
    @exercise.save_source("contents")
    Do.notify(:load_step, {:scene => scene, :step => @step})
    test_source = scene.find("editor_input")
    test_source.should_not be_nil
    test_source.text.should == @exercise.source
  end
  
end
