require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "chapter"

describe Chapter do
  
  before do
    on_first_step
    @directory = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/template_method/chapter"))
    @chapter = @lesson.chapter
  end
  
  it "chapter from the directives" do
    @chapter.path.should == "chapter"
  end
  
  it "chapter gets the title" do
    @chapter.title.should == IO.read(File.join(@directory, "title"))
  end
    
  it "chapter gets the contents" do
    @chapter.contents.should == IO.read(File.join(@directory, "contents"))
  end
  
  it "chapter gets the resources" do
    @chapter.resources.first.should == (IO.read(File.join(@directory, "resources")).split("\n").first)
  end
  

end