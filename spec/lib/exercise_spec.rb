require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "exercise"
describe Exercise do
  
  before do
    @exercise = Exercise.new(:spec_filename => "filename", :run_examples => false)
  end
  
  context "initialize" do

    it "has a spec filename" do
      @exercise.spec_filename.should == "filename"
    end

    it "has an initially empty error stream" do
      @exercise.error_stream.string.should == ""
    end

    it "has an initially empty output stream" do
      @exercise.output_stream.string.should == ""
    end
    
    it "has initial examples_should_be_run" do
      @exercise.run_examples.should == false
    end

  end
  
  
  context "#run_specs" do

    before do
      @exercise.output_stream = StringIO.new "output"
      @exercise.error_stream = StringIO.new "errors"
      @exercise.run
    end
    
    it "sends output steam and error stream to the spec runner" do
      @exercise.options.should_not be_nil
      @exercise.options.error_stream.should == @exercise.error_stream
      @exercise.options.output_stream.should == @exercise.output_stream
    end
    
    it "adds the filename to the file list" do
      @exercise.options.files.should include("filename")
    end
    
    it "sends options" do
      Spec::Runner.options.should == @exercise.options
    end
        

  end
  
  
  
  
end
