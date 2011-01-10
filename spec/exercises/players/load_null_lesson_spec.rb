require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require "directory_chooser"

describe "load null lesson" do
  uses_limelight :scene => "exercises", :hidden => true
  before do
    production.step_runner_factory = Mocks::StepRunnerFactory.new(:output => "put", :failed_count => 0)
    production.magistro_root = File.expand_path(File.dirname(__FILE__) + "/../../test_space")
    @file = File.expand_path(File.join(File.dirname(__FILE__), "/../../Gemfile"))
    @path = mock('path', :get_absolute_path => File.join(@file))
    @chooser = mock("DirectoryChooser", :ask_chooser => @file)
    DirectoryChooser.stub!(:new).and_return(@chooser)
  end
  
  it "loads the file" do
    @chooser.should_receive(:ask_chooser).with("Enter Lesson Directory").and_return(@file)
    click "load_lesson_button"
    production.current_lesson.reader.class.should == NullReader
  end
  
end