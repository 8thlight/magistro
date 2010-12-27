require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "error_formatter"

describe ErrorFormatter do
  
  it "formats out the module" do
    ErrorFormatter::format("uninitialized constant #<Module:01x2x>::A").should == "uninitialized constant A"
  end
end
