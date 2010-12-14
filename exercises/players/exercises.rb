require File.expand_path(File.dirname(__FILE__) + "/run_observer")
 

on_scene_opened do
  change_background = Proc.new do |runner, scene|
    tests_prop = scene.find("tests")
    if runner.failed_count == 0
      tests_prop.style.background_color = "335003"
      tests_prop.style.secondary_background_color = "618108"
    else
      tests_prop.style.background_color = "ff0300"
      tests_prop.style.secondary_background_color = "b1212b"
    end
  end
  
  udpate_output = Proc.new do |runner, scene|
    scene.find("failure_count").text = "#{runner.failed_count} failure"
    scene.find("output").text = runner.output
  end
  
  RunObserver.register change_background
  RunObserver.register udpate_output
end
