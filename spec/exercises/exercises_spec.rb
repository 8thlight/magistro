require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Exercises Props scene" do

  uses_limelight :scene => "exercises", :hidden => true

  def find_prop(locator)
    @prop = scene.find(locator)
    @prop.should_not be_nil
  end
  
  context "teaching" do
    
    it "displays teaching area" do
      find_prop("teaching")
    end
    
    it "has a load lesson button" do
      find_prop("load_lesson_button")
      @prop.name.should == "button"
      @prop.players.should include("load_lesson")
    end
  end

  it "displays editor" do
    find_prop("editor")
  end
  
  context "Test Area" do
    it "has tests prop" do
      find_prop("tests")
    end
    
    it "has save button" do
      find_prop("save_button")
      @prop.name.should == "button"
      @prop.players.should include("save")
    end
    
    it "has run specs button" do
      find_prop("run_button")
      @prop.name.should == "button"
      @prop.players.should include("run")
    end
    
  end
end