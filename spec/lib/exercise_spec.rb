require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

require "exercise"
require 'fileutils'

describe  Exercise do

  before(:each) do
    @directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple")
  end

  it "validates directory was choosen" do
    lambda{Exercise.new("blahblah")}.should raise_error("blahblah is not a valid Exercise.")
  end

  it "creates Exercise from a directory" do
    exercise = Exercise.new(@directory)
    exercise.should_not be_nil
  end

  it "gets the name from a meta file" do
    exercise = Exercise.new(@directory)
    exercise.name.should == "simple"
  end

  it "has steps" do
    exercise = Exercise.new(@directory)
    (exercise.steps.size > 1).should be_true
    exercise.steps.first.instructions.should == "First we need to create a base class"
  end
  
  context "#save_source and #source" do
    before do
      @exercise = Exercise.new(@directory)
    end
    
    it "saves the source in the step directory" do
      source_filename = File.join(@directory, "source.rb")
      @exercise.save_source("contents")
      IO.read(source_filename).should == "contents"
      File.delete(source_filename)
    end

    it "replaces instead of appends" do
      source_filename = File.join(@directory,  "source.rb")
      @exercise.save_source("contents")
      @exercise.save_source("contents")
      IO.read(source_filename).should == "contents"
      File.delete(source_filename)
    end

    it "reads the source.rb file" do
      filename = File.join(@directory, "source.rb")
      File.delete(filename) if File.exist?(filename) 
      source_contents = "class A; end;"
      File.open(File.join(@directory, "source.rb"), 'a') {|file| file.write(source_contents)}
      @exercise.source.should == source_contents

    end

  end
  

end
