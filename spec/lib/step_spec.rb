require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "step"

describe Step do

  before do                                     0
    @directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/1")
    @spec_filename = File.expand_path(File.join(@directory, "class_spec.rb"))
    @step = Step.new(:run_examples => false, :directory => @directory)
  end
  
  context "initialize" do

    it "has a spec contents" do
      @step.spec.should == File.read(@spec_filename)
    end


    it "has instructions" do
      @step.instructions.should == "First we need to create a base class"
    end

  end
  

  context "#save_source" do

    it "saves the source in the step directory" do
      source_filename = File.join(@directory, "source.rb")
      @step.save_source("contents")
      IO.read(source_filename).should == "contents"
      File.delete(source_filename)
    end

    it "replaces instead of appends" do
      source_filename = File.join(@directory,  "source.rb")
      @step.save_source("contents")
      @step.save_source("contents")
      IO.read(source_filename).should == "contents"
      File.delete(source_filename)
    end
  end

  context "#source" do

    it "reads the source.rb file" do
      filename = File.join(@directory, "source.rb")
      File.delete(filename) if File.exist?(filename) 
      source_contents = "class A; end;"
      File.open(File.join(@directory, "source.rb"), 'a') {|file| file.write(source_contents)}
      @step.source.should == source_contents

    end

  end

end
