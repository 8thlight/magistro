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

    it "has an initially empty error stream" do
      @step.error_stream.string.should == ""
    end

    it "has an initially empty output stream" do
      @step.output_stream.string.should == ""
    end
    
    it "has initial examples_should_be_run" do
      @step.run_examples.should == false
    end

    it "has instructions" do
      @step.instructions.should == "First we need to create a base class"
    end

  end
  
  
  context "#run_specs" do

    before do
      @step.output_stream = StringIO.new "output"
      @step.error_stream = StringIO.new "errors"
      @step.run
    end
    
    it "sends output steam and error stream to the spec runner" do
      @step.options.should_not be_nil
      @step.options.error_stream.should == @step.error_stream
      @step.options.output_stream.should == @step.output_stream
    end
    
    it "adds the filename to the file list" do
      @step.options.files.should include(@spec_filename)
    end
    
    it "sends options" do
      Spec::Runner.options.should == @step.options
    end
        

  end
  
  
  
  
end
