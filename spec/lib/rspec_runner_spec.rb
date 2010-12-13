require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "rspec_runner"
require 'fileutils'

describe "Rspec Runner" do

  context "#run" do

    before do
      @directory = File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple/1")
      @spec_filename = File.expand_path(File.join(@directory, "class_spec.rb"))
      @runner = RspecRunner.new(:run_examples => false, :filename=> @spec_filename)
      @runner.run
    end

    it "sends output steam and error stream to the spec runner" do
      @runner.options.should_not be_nil
      @runner.options.error_stream.should == @runner.error_stream
      @runner.options.output_stream.should == @runner.output_stream
    end

    it "adds the filename to the file list" do
      @runner.options.files.should include(@spec_filename)
    end
    it "has an initially empty error stream" do
      @runner.error_stream.string.should == ""
    end

    it "has an initially empty output stream" do
      @runner.output_stream.string.should == ""
    end

    it "has initial examples_should_be_run" do
      @runner.run_examples.should == false
    end


    it "sends options" do
      Spec::Runner.options.should == @runner.options
    end


  end
end