require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "mocks/step_runner"
require "step"
require "step_runner"

describe "Run Exercise", "with next/previous" do

  uses_limelight :scene => "exercises", :hidden => true
  before do
    production.step_runner_factory = Mocks::StepRunner
    
    @first_step_directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/1")
    @first_step = Step.new(:directory => @first_step_directory)
    @last_step_directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/2")
    @last_step = Step.new(:directory => @last_step_directory)
  end
  
  it "creates a next button" do
    production.current_step = @first_step
    click "run_button"
    scene.find_by_name("next_button").first.should_not be_nil
  end
  
  it "no next button" do
    production.current_step = @last_step
    click "run_button"
    scene.find_by_name("next_button").first.should be_nil
  end
  
  
end
