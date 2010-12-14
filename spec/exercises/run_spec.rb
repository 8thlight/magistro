require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "step"
require "step_runner"
describe "Run Exercise" do

  uses_limelight :scene => "exercises", :hidden => true
  before do 
    exercise = mock('exercise', :save_source => nil)
    step = mock(Step, :exercise => exercise)
    
    @step_runner = mock(StepRunner, :run => nil, :output => "put")
    production.current_step = step
    StepRunner.stub!(:new).and_return(@step_runner)
  end
  
  context "passing" do
    before do
      @step_runner.stub!(:failed_count).and_return(0)
    end
    
    it "saves the editor section to a file" do
      production.current_step.exercise.should_receive(:save_source).with("class A; end;")
      scene.find("editor_input").text = "class A; end;"
      click "run_button"
    end
  
    it "runs the spec" do
      StepRunner.should_receive(:new).with(production.current_step).and_return(@step_runner)
      @step_runner.should_receive(:run)
      click "run_button"
    end

    it "sets the output to the screen" do
      click "run_button"
      scene.find("failure_count").text.should == "0 failure"
    end
  
    it "sets the output to the tests output" do
      click "run_button"
      scene.find("output").text.should == "put"    
    end
  
    it "sets the background to green if there are no failures" do
      click "run_button"
      tests = scene.find("tests")
      tests.style.background_color.should == "#335003ff"
      tests.style.secondary_background_color.should ==  "#618108ff"
    end
  end
  
  context "failing" do
    before do
      @step_runner.stub(:failed_count).any_number_of_times.and_return(2)
    end
  
    it "sets the output to the screen" do
      click "run_button"
      scene.find("failure_count").text.should == "2 failure"
    end
    
    it "sets the background to green if there are no failures" do
      click "run_button"
      tests = scene.find("tests")
      tests.style.background_color.should == "#ff0300ff"
      tests.style.secondary_background_color.should ==  "#b1212bff"
    end
    
    
  end
  
end