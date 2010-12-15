require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "directory_chooser"
describe "Load Lesson" do

  uses_limelight :scene => "exercises", :hidden => true
  before do
    @directory = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple"))
    @path = mock('path', :get_absolute_path => File.join(@directory))
    @chooser = mock("DirectoryChooser", :ask_chooser => @directory)
    DirectoryChooser.stub!(:new).and_return(@chooser)
  end

  it "loads the file" do
    @chooser.should_receive(:ask_chooser).with("Enter Lesson Directory").and_return(@directory)
    click("load_lesson_button")
    production.current_exercise.directory.should == @directory
    production.current_step.should_not be_nil
  end

  it "shows the source" do
    @chooser.should_receive(:ask_chooser).with("Enter Lesson Directory").and_return(@directory)
    click("load_lesson_button")
    scene.find("test_source").text.should == File.read(File.join(@directory, "1", "class_spec.rb"))
  end

  it "shows the step instructions" do
    click("load_lesson_button")
    scene.find("instructions").text.should == File.read(File.join(@directory, "1", "instructions"))
  end
  
end