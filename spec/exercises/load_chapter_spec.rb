require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "directory_chooser"
describe "Load Lesson" do

  uses_limelight :scene => "exercises", :hidden => true
  before do
    @directory = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple"))
  end
  
  it "opens a new stage with the chapter" do
    click("load_chapter_button")
    chapter_stage = scene.production.theater["chapter"]
    chapter_stage.should_not be_nil
    chapter_stage.title.should == "Chapter"
    chapter_stage.size.should == ["600", "400"]
  end
end
