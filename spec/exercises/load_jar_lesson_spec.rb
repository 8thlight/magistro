require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "directory_chooser"

describe "Load Jar Lesson" do

  uses_limelight :scene => "exercises", :hidden => true
  
  before do
    @jar = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/lessons/template_method.jar"))
    @path = mock('path', :get_absolute_path => File.join(@jar))
    @chooser = mock("DirectoryChooser", :ask_chooser => @jar)
    DirectoryChooser.stub!(:new).and_return(@chooser)
  end

  it "sends in the Jar reader" do
    click "load_lesson_button"
    production.current_lesson.reader.class.should == JarReader
  end

end