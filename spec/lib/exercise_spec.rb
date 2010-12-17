require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

require "exercise"
require 'fileutils'

describe  Exercise do

  before(:each) do
    @directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple")
  end

  it "validates directory was choosen" do
    lambda{Exercise.new("blahblah")}.should raise_error("blahblah is not valid.")
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
      @source_filename = File.join(@directory, "source.rb")
    end
    
    after do
      File.delete(@source_filename) if File.exists?(@source_filename)
    end
    
    it "saves the source in the step directory" do
      source_filename = File.join(@directory, "source.rb")
      @exercise.save_source("contents")
      IO.read(@source_filename).should == "contents"      
    end

    it "replaces instead of appends" do
      @exercise.save_source("contents")
      @exercise.save_source("contents")
      IO.read(@source_filename).should == "contents"
    end

    it "reads the source.rb file" do
      File.delete(@source_filename) if File.exist?(@source_filename) 
      source_contents = "class A; end;"
      File.open(@source_filename, 'a') {|file| file.write(source_contents)}
      @exercise.source.should == source_contents
    end

  end
  
  context "step navigation" do
    
    before do
      @exercise = Exercise.new(@directory)
    end
    
    it "gets the next step" do
      first_step = @exercise.steps.first
      next_step = @exercise.next(first_step)
      next_step.directory.should == File.expand_path(File.join(@directory, "2"))
    end
    
    it "returns nil if there is no next step" do
      last_step = @exercise.steps.last
      next_step = @exercise.next(last_step)
      next_step.should be_nil
    end
    
    it "gets the previous step" do
      last_step = @exercise.steps.last
      previous_step = @exercise.previous(last_step)
      previous_step.directory.should ==  File.expand_path(File.join(@directory, "1"))
    end
    
    it "gets the previous step" do
      first_step = @exercise.steps.first
      previous_step = @exercise.previous(first_step)
      previous_step.should be_nil
    end
    
  end
  

end
