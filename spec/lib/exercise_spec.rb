require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

require "exercise"
require 'fileutils'

describe  Exercise do

  before(:each) do
    @dir_name = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple")
  end

  it "validates directory was choosen" do
    lambda{Exercise.load_from("blahblah")}.should raise_error("blahblah is not a valid Exercise.")
  end

  it "creates Exercise from a directory" do
    exercise = Exercise.load_from(@dir_name)
    exercise.should_not be_nil
  end

  it "gets the name from a meta file" do
    exercise = Exercise.load_from(@dir_name)
    exercise.name.should == "simple"
  end

  it "has steps" do
    exercise = Exercise.load_from(@dir_name)
    exercise.steps.size.should == 1
    exercise.steps[0].description.should == "First we need to create a base class"
  end

end
