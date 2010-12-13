require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "rspec_runner"

describe "Run Exercise" do

  uses_limelight :scene => "exercises", :hidden => true
  before do 
    @mouse = Limelight::Mouse.new
    @runner = mock("RspecRunner", :run => nil)
    production.current_step = MockStep.new
    RspecRunner.stub!(:new).and_return(@runner)
  end

  it "saves the editor section to a file" do
    scene.find("editor_input").text = "class A; end;"
    click "run_button"
    production.current_step.source.should == "class A; end;"
  end

  it "runs the exercises step" do
    RspecRunner.should_receive(:new).with(production.current_step.spec_filename).and_return(@runner)    
    @runner.should_receive(:run)
    click "run_button"
  end

  it "sets the output to the screen" do
    production.current_step.output_stream = "...F"
    click "run_button"
    scene.find("output").text.should == production.current_step.output_stream
  end
  
end