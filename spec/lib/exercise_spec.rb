require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

require "exercise"
require 'fileutils'

describe  Exercise do

  before(:each) do
    on_first_step
    @directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple")
  end

  it "creates Exercise from a directory" do
    @exercise.should_not be_nil
  end

  it "gets the name from a meta file" do
    @exercise.name.should == "simple"
  end

  it "has steps" do
    (@exercise.steps.size > 1).should be_true
    @exercise.steps.first.instructions.should == "First we need to create a base class"
  end
  
  it "has a lesson" do
    @exercise.lesson.should == @lesson
  end
  
  context "#save_source and #source" do
    before do
      @source_filename = File.join(@directory, "source.rb")
    end
    
    after do
      File.delete(@source_filename) if File.exists?(@source_filename)
    end
    
    it "saves the source in the step directory" do
      @exercise.save_source("contents")
      @exercise.source.should == "contents"
    end

    it "replaces instead of appends" do
      @exercise.save_source("contents")
      @exercise.save_source("contents")
      @exercise.source.should == "contents"
    end

  end
  
  context "step navigation" do
    it "gets the next step" do
      first_step = @exercise.steps.first
      next_step = @exercise.next(first_step)
      next_step.position.should == 2
    end
    
    it "returns nil if there is no next step" do
      last_step = @exercise.steps.last
      next_step = @exercise.next(last_step)
      next_step.should be_nil
    end
    
    it "gets the previous step" do
      last_step = @exercise.steps.last
      previous_step = @exercise.previous(last_step)
      previous_step.position.should ==  1
    end
    
    it "gets the previous step" do
      first_step = @exercise.steps.first
      previous_step = @exercise.previous(first_step)
      previous_step.should be_nil
    end
    
  end
  

end
