require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "rspec_runner"

describe "Run Exercise" do

  uses_limelight :scene => "exercises", :hidden => true
  before do 
    @mouse = Limelight::Mouse.new
    @runner = mock("RspecRunner", :run => nil, :output_stream => StringIO.new("...F"))
    production.current_step = MockStep.new
    RspecRunner.stub!(:new).and_return(@runner)
  end

  it "saves the editor section to a file" do
    scene.find("editor_input").text = "class A; end;"
    click "run_button"
    production.current_step.source.should == "class A; end;"
  end

  it "runs the exercises step" do
    RspecRunner.should_receive(:new).with(:filename => production.current_step.spec_filename).and_return(@runner)    
    @runner.should_receive(:run)
    click "run_button"
  end

  it "sets the output to the screen" do
    @runner.should_receive(:output_stream).and_return(StringIO.new("...F"))
    click "run_button"
    scene.find("output").text.should == "...F"
  end

  it "sets the error message to the screen." do
    @runner.should_receive(:output_stream).and_return(StringIO.new(""))
    @runner.should_receive(:error_stream).and_return(StringIO.new("you miss-spelled"))

    click "run_button"
    scene.find("output").text.should == "you miss-spelled"
  end
  
end