require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "directory_chooser"
describe "Chooser" do

  before do
    @directory = File.expand_path(File.join(File.dirname(__FILE__), "/../../etc/template_method/1_simple"))
    @path = mock('path', :get_absolute_path => File.join(@directory))
    @jchooser = mock("JFileChooser", :null_object => true, :get_selected_file => @path, :show_open_dialog => Java::javax::swing::JFileChooser::APPROVE_OPTION)
    Java::javax::swing::JFileChooser.stub!(:new).and_return(@jchooser)
    @chooser = DirectoryChooser.new
  end

  it "creates a JFileChooser" do
    Java::javax::swing::JFileChooser.should_receive(:new).and_return(@jchooser)
    @chooser.ask_chooser("Enter Lesson Directory")
  end

  it "uses the JFileChooser successfully" do
    @jchooser.should_receive(:set_dialog_title).with("Enter Lesson Directory")
    @jchooser.should_receive(:show_open_dialog).and_return(Java::javax::swing::JFileChooser::APPROVE_OPTION)
    @jchooser.should_receive(:get_selected_file).and_return(@path)
    @chooser.ask_chooser("Enter Lesson Directory")
  end

  it "uses the JFileChooser unsuccessfully" do
    @jchooser.should_receive(:set_dialog_title).with("Enter Lesson Directory")
    @jchooser.should_receive(:show_open_dialog).and_return(Java::javax::swing::JFileChooser::ERROR_OPTION)
    @jchooser.should_not_receive(:get_selected_file)
    @chooser.ask_chooser("Enter Lesson Directory")
  end

  it "loads the file" do
    @jchooser.should_receive(:show_open_dialog).and_return(Java::javax::swing::JFileChooser::APPROVE_OPTION)
    @jchooser.should_receive(:get_selected_file).and_return(@path)
    @chooser.ask_chooser("Enter Lesson Directory")
  end

  it "only selects directories" do
    @jchooser.should_receive(:setFileSelectionMode).with(Java::javax::swing::JFileChooser::FILES_AND_DIRECTORIES )
    @chooser.ask_chooser("Enter Lesson Directory")
  end

end