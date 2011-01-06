require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "Run All tests" do
  
  uses_limelight :scene => "exercises", :hidden => true
  
  before do 
    on_first_step
    production.step_runner_factory = Mocks::StepRunnerFactory.new(:output => "put", :failed_count => 0)
  end
  
  it "it runs multiple steps" do
    click "run_all_button"
    production.step_runner_factory.runner_count.should == 2
  end
  
  it "stops at a failed spec" do
    production.step_runner_factory.runners << Mocks::StepRunner.new(nil, :failed_count => 1)
    production.step_runner_factory.runners << Mocks::StepRunner.new(nil, :failed_count => 0)
    click "run_all_button"
    
    production.current_step.path.should == @exercise.steps.last.path
    
    scene.find("failure_count").text.should == "1 failure"    
  end
  
  it "loads up failed spec" do
    production.step_runner_factory.runners << Mocks::StepRunner.new(nil, :failed_count => 1)
    production.step_runner_factory.runners << Mocks::StepRunner.new(nil, :failed_count => 0)
    click "run_all_button"
    
    scene.find("failure_count").text.should == "1 failure"    
    scene.find("instructions").text.should == @exercise.steps.last.instructions
  end
end