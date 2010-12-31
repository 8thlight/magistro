require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require "directory_chooser"
describe "Load Directory Lesson" do

  uses_limelight :scene => "exercises", :hidden => true

  before do
    production.step_runner_factory = Mocks::StepRunnerFactory.new(:output => "put", :failed_count => 0)
    production.magistro_root = File.expand_path(File.dirname(__FILE__) + "/../../test_space")
    @directory = File.expand_path(File.join(File.dirname(__FILE__), "/../../../etc/template_method"))
    @exercise_directory = File.join(@directory, "1_simple")
    @path = mock('path', :get_absolute_path => File.join(@directory))
    @chooser = mock("DirectoryChooser", :ask_chooser => @directory)
    DirectoryChooser.stub!(:new).and_return(@chooser)
  end

  it "loads the file" do
    @chooser.should_receive(:ask_chooser).with("Enter Lesson Directory").and_return(@directory)
    click "load_lesson_button"
    production.current_lesson.path.should == @directory
    production.current_exercise.path.should == "1_simple"
    production.current_step.position.should == 1
  end

  it "shows the source" do
    @chooser.should_receive(:ask_chooser).with("Enter Lesson Directory").and_return(@directory)
    click "load_lesson_button"
    scene.find("test_source").text.should == File.read(File.join(@exercise_directory, "1", "spec"))
  end

  it "shows the step instructions" do
    click "load_lesson_button"
    scene.find("instructions").text.should == File.read(File.join(@exercise_directory, "1", "instructions"))
  end
  
  it "sends in the directory reader" do
    click "load_lesson_button"
    production.current_lesson.reader.class.should == DirectoryReader
  end
  
  it "runs the spec on load" do
    click "load_lesson_button"
    production.step_runner_factory.runner.ran?.should be_true 
  end
    
end