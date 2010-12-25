require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'lesson'

describe "Chapters scene displays information" do

  before do
    @directory = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/template_method"))
    reader = DirectoryReader.new(@directory)
    @lesson = Lesson.new(reader.lesson_path, {:magistro_root => ".", :reader => reader})
    production.current_lesson = @lesson
  end

  uses_limelight :scene => "chapters", :hidden => true
  
  it "displays the title" do
    scene.find("title").text.should == @lesson.chapter.title
  end
  
  it "displays the contents" do
    scene.find("contents").text.should == @lesson.chapter.contents
  end

  it "adds links to the resources" do
    resources_prop = scene.find("resources")
    @lesson.chapter.resources.each do |resource|
      link = scene.find(resource)
      link.should_not be_nil
      link.name.should == "link"
      link.text.should == resource
    end
  end
end
