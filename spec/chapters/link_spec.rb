require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "browser"
require "lesson"
describe "Link calls out to browser" do

  before do
    @directory = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/template_method"))
    reader = DirectoryReader.new(@directory)
    @lesson = Lesson.new(reader.lesson_path, {:magistro_root => ".", :reader => reader})
    production.current_lesson = @lesson
  end

  uses_limelight :scene => "chapters", :hidden => true
  
  it "loads browswer when link clicked" do
    url = @lesson.chapter.resources.first
    Browser.should_receive(:show_in_browser).with(url)
    click url
  end
  
end
