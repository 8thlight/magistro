require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "mocks/step_runner"
require "mocks/step_runner_factory"
require "step"
require "step_runner"
describe "Run Exercise" do

  uses_limelight :scene => "exercises", :hidden => true
  before do 
    @step_directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/1")
    @step = Step.new(@step_directory)
    production.current_step = @step
    production.step_runner_factory = Mocks::StepRunnerFactory.new(:output => "put", :failed_count => 0)
  end
  
  context "passing" do
    it "saves the editor section to a file" do
      source = "class A; end;"
      scene.find("editor_input").text = source
      click "run_button"
      @step.exercise.source.should == source
    end
  
    it "runs the spec" do
      click "run_button"
      production.step_runner_factory.runner.ran?.should be_true
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
      production.step_runner_factory = Mocks::StepRunnerFactory.new(:output => "put", :failed_count => 2)
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