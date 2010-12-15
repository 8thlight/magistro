require File.expand_path(File.dirname(__FILE__) + "/run_observer")
 

on_scene_opened do
  RunObserver.on_run do |runner, scene|
    tests_prop = scene.find("tests")
    if runner.failed_count == 0
      tests_prop.style.background_color = "335003"
      tests_prop.style.secondary_background_color = "618108"
    else
      tests_prop.style.background_color = "ff0300"
      tests_prop.style.secondary_background_color = "b1212b"
    end
  end
  
  RunObserver.on_run do |runner, scene|
    scene.find("failure_count").text = "#{runner.failed_count} failure"
    scene.find("output").text = runner.output
  end
  
  RunObserver.on_run do |runner, scene|
    next_step = runner.step.exercise.next(runner.step)
    if  !next_step.nil? && runner.failed_count == 0
      next_button = Limelight::Prop.new(:name => "next_button", :players => "button", :text => "Next", :id => "step_#{next_step.directory}")
      scene.find("tests_navigation").add(next_button) if scene.find_by_name("next_button").empty?
    end
  end
  
end
