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
  
end