require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "observer"
describe "Observer" do
  
  
  it "registers an observer" do
    tester = true
    Observer.on(:test) do |tester|
      tester = false
    end
    tester.should be_true
    Observer.notify(:test, tester)
    tester.should be_false
  end
  
  it "registers for multiple events" do
    tester = true
    Observer.on([:test, :again]) {|tester| tester = false}
    tester.should be_true
    Observer.notify(:test, tester)
    tester.should be_false
    tester = true
    Observer.notify(:again, tester)
    tester.should be_false
  end
  
  it "raises exception if there is nothing registered" do
    lambda{Observer.notify(:blahbla)}.should raise_error("No events are registered for blahbla.")
  end
end
