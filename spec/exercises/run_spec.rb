require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Run Exercise" do

  uses_limelight :scene => "exercises", :hidden => true
  before do 
    step = mock(Step, :save_source => nil)
    @step_runner = mock(StepRunner, :run => nil, :failed_count => 1, :example_count => 2, :output => "put")
    production.current_step = step
    StepRunner.stub!(:new).and_return(@step_runner)
  end

  it "saves the editor section to a file" do
    production.current_step.should_receive(:save_source).with("class A; end;")
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
    scene.find("failure_count").text.should == "1 failure"
  end
  
  it "sets the output to the tests output" do
    click "run_button"
    scene.find("output").text.should == "put"    
  end
  
end