require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
describe "Run Exercise" do

  uses_limelight :scene => "exercises", :hidden => true
  before do 
    @mouse = Limelight::Mouse.new
  end
  
#  it "runs tests and sets the output" do
#    production.current_exercise = Exercise.new(:spec_filename => "filename", :run_examples => false)
#    production.current_exercise.output_stream = StringIO.new("output")
#    @mouse.click(scene.find("run_button"))
#    scene.find("output").text.should == "output"
#  end
  
end