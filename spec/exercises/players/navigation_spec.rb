require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require "mocks/step_runner"
require "mocks/step_runner_factory"
require "step"
require "step_runner"
require "observer"

describe "Run Exercise", "with next/previous" do

  uses_limelight :scene => "exercises", :hidden => true

  before do
    production.step_runner_factory = Mocks::StepRunnerFactory.new(:failed_count => 0)
    on_first_step
    @first_step = @exercise.steps.first
    @last_step = @exercise.steps.last
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
      click "step_#{@last_step.position}"
      scene.find("test_source").text.should == @last_step.spec
      scene.find("instructions").text = @last_step.instructions
      production.current_step.should == @last_step
    end
    
    it "navigation runs the spec" do
      production.current_step = @first_step
      click "run_button"
      click "step_#{@last_step.position}"  
      production.step_runner_factory.runner_count.should == 2    
    end
    
    it "removes the next if there is one and no next" do
      production.current_step = @first_step
      click "run_button"
      click "step_#{@last_step.position}"
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
      click "step_#{@first_step.position}"
      scene.find("test_source").text.should == @first_step.spec
      scene.find("instructions").text = @first_step.instructions
      production.current_step.should == @first_step
    end
    
    it "removes the next if there is one and no next" do
      production.current_step = @last_step
      click "run_button"
      click "step_#{@first_step.position}"
      scene.find("previous_container").children.size.should == 0
    end
  end
  
end
