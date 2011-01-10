require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "directory_chooser"
require "reader_factory"

describe ReaderFactory do
  
  it "should respond to a JAR file with JarReader" do
    @jar = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/lessons/template_method.jar"))
    reader = ReaderFactory.create(@jar)
    reader.class.should == JarReader
  end
  
  it "should respond to a directory with DirectoryReader" do
    @dir = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/template_method"))
    reader = ReaderFactory.create(@dir)
    reader.class.should == DirectoryReader
  end

  it "should respond to a non-jar file with NullReader" do
    @file = File.expand_path(File.dirname(__FILE__) + "/../../Gemfile")
    reader = ReaderFactory.create(@file)
    reader.class.should == NullReader
  end

  it "should respond to anythng else with NullReader" do
    @null = 'Nothing to see here.'
    reader = ReaderFactory.create(@null)
    reader.class.should == NullReader
  end

end