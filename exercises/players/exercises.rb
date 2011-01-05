require File.expand_path(File.dirname(__FILE__) + "/../../lib/observer")

on_scene_opened do
  
  #TODO - PWP - require all observers in the observer directory
  ["change_background", "run_output", "run", "navigation", "load_step", "run_all"].each do |observer|
    require File.expand_path(File.dirname(__FILE__) + "/../observers/#{observer}")
  end
end
