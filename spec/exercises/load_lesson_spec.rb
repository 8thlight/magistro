require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
describe "Load Lesson" do

  uses_limelight :scene => "exercises", :hidden => true
  before do 
    @chooser = mock("JFileChooser", :null_object => true)
    Java::javax::swing::JFileChooser.stub!(:new).and_return(@chooser)
    @mouse = Limelight::Mouse.new
  end
  
  it "creates a JFileChooser" do
    Java::javax::swing::JFileChooser.should_receive(:new).and_return(@chooser)
    @mouse.click(scene.find("load_lesson_button"))
  end

  it "uses the JFileChooser successfully" do
    @chooser.should_receive(:set_dialog_title).with("Enter filename of lesson")
    @chooser.should_receive(:show_open_dialog).and_return(Java::javax::swing::JFileChooser::APPROVE_OPTION)
    @chooser.should_receive(:get_selected_file).and_return(mock('path', :get_absolute_path => 'filename'))
    @mouse.click(scene.find("load_lesson_button"))
  end
  
  it "uses the JFileChooser successfully" do
    @chooser.should_receive(:set_dialog_title).with("Enter filename of lesson")
    @chooser.should_receive(:show_open_dialog).and_return(Java::javax::swing::JFileChooser::ERROR_OPTION)
    @chooser.should_not_receive(:get_selected_file)
    @mouse.click(scene.find("load_lesson_button"))
  end
  
  it "loads the file" do
    @chooser.should_receive(:show_open_dialog).and_return(Java::javax::swing::JFileChooser::APPROVE_OPTION)
    @chooser.should_receive(:get_selected_file).and_return(mock('path', :get_absolute_path => 'filename'))
    @mouse.click(scene.find("load_lesson_button"))
    production.current_exercise.spec_filename.should == 'filename'
  end
  
  context "load the spec file" do

    before do
      @filename = "test.file"
      File.open(@filename, 'a') {|file| file.write("Spec contents")}
    end
    
    after do
      File.delete(@filename)
    end

    it "shows the source" do      
      @chooser.should_receive(:show_open_dialog).and_return(Java::javax::swing::JFileChooser::APPROVE_OPTION)
      @chooser.should_receive(:get_selected_file).and_return(mock('path', :get_absolute_path => @filename))
      @mouse.click(scene.find("load_lesson_button"))
      scene.find("test_source").text.should == "Spec contents"
    end
    
  end
  
  
end