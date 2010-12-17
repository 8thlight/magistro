require File.expand_path(File.dirname(__FILE__) + "/../../lib/observer")

on_scene_opened do
  ["change_background", "run_output", "run", "navigation", "load_step"].each do |observer|
    require File.expand_path(File.dirname(__FILE__) + "/../observers/#{observer}")
  end
end
