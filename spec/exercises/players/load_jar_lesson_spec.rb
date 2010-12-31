require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require "directory_chooser"

describe "Load Jar Lesson" do

  uses_limelight :scene => "exercises", :hidden => true
  
  before do
    @jar = File.expand_path(File.join(File.dirname(__FILE__), "/../../../etc/lessons/template_method.jar"))
    production.step_runner_factory = Mocks::StepRunnerFactory.new(:output => "put", :failed_count => 0)
    production.magistro_root = File.expand_path(File.dirname(__FILE__) + "/../../test_space")
    @path = mock('path', :get_absolute_path => File.join(@jar))
    @chooser = mock("DirectoryChooser", :ask_chooser => @jar)
    DirectoryChooser.stub!(:new).and_return(@chooser)
  end

  it "sends in the Jar reader" do
    @chooser.should_receive(:ask_chooser).with("Enter Lesson Directory").and_return(@jar)
    click "load_lesson_button"
    production.current_lesson.reader.class.should == JarReader
  end

end