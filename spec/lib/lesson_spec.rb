require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "lesson"

describe Lesson do
  
  before do
    @directory = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/template_method"))
    @lesson = Lesson.new(@directory)
  end

  it "loads a lesson by its directory" do
    @lesson.directory.should == @directory
  end
  
  it "has the exercises in the directory" do
    @lesson.exercises.size.should == 2
    @lesson.exercises.first.name.should == "simple"    
  end
  
  it "loads up the chapter" do
    @lesson.chapter.directory.should == File.join(@directory, "chapter")
  end
  
end