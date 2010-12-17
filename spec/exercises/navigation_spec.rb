require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "mocks/step_runner"
require "mocks/step_runner_factory"
require "step"
require "step_runner"
require "observer"

describe "Run Exercise", "with next/previous" do

  uses_limelight :scene => "exercises", :hidden => true

  before do
    production.step_runner_factory = Mocks::StepRunnerFactory.new(:failed_count => 0)
    
    @first_step_directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/1")
    @first_step = Step.new(@first_step_directory)
    @last_step_directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/2")
    @last_step = Step.new(@last_step_directory)
  end
  
  context "NEXT" do
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
  
    it "next button loads the spec" do
      production.current_step = @first_step
      click "run_button"
      click "step_#{@last_step.directory}"
      scene.find("test_source").text.should == @last_step.spec
      scene.find("instructions").text = @last_step.instructions
      production.current_step.should == @last_step
    end
    
    it "navigation runs the spec" do
      production.current_step = @first_step
      click "run_button"
      click "step_#{@last_step.directory}"  
      production.step_runner_factory.runner_count.should == 2    
    end
    
    it "removes the next if there is one and no next" do
      production.current_step = @first_step
      click "run_button"
      click "step_#{@last_step.directory}"
      scene.find("next_container").children.size.should == 0
    end
  end
  
  context "previous" do
    it "creates a previous button" do
      production.current_step = @last_step
      click "run_button"
      scene.find_by_name("previous_button").first.should_not be_nil
    end
  
    it "no previous button" do
      production.current_step = @first_step
      click "run_button"
      scene.find_by_name("previous_button").first.should be_nil
    end
  
    it "previous button loads the spec" do
      production.current_step = @last_step
      click "run_button"
      click "step_#{@first_step.directory}"
      scene.find("test_source").text.should == @first_step.spec
      scene.find("instructions").text = @first_step.instructions
      production.current_step.should == @first_step
    end
    
    it "removes the next if there is one and no next" do
      production.current_step = @last_step
      click "run_button"
      click "step_#{@first_step.directory}"
      scene.find("previous_container").children.size.should == 0
    end
  end
  
end
