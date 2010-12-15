require File.expand_path(File.dirname(__FILE__) + "/../../lib/observer")


on_scene_opened do
  Observer.on(:run) do |options|
    runner = options[:runner]
    scene = options[:scene]

    tests_prop = scene.find("tests")
    if runner.failed_count == 0
      tests_prop.style.background_color = "335003"
      tests_prop.style.secondary_background_color = "618108"
    else
      tests_prop.style.background_color = "ff0300"
      tests_prop.style.secondary_background_color = "b1212b"
    end
  end
  
  Observer.on(:run) do |options|
    runner = options[:runner]
    scene = options[:scene]
    
    scene.find("failure_count").text = "#{runner.failed_count} failure"
    scene.find("output").text = runner.output
  end
  
  Observer.on([:run, :load_step]) do |options|
    scene  = options[:scene]
    step   = options[:step]
    
    previous_step = step.exercise.previous(step)
    if  !previous_step.nil?
      previous_button = Limelight::Prop.new(:name => "previous_button", :players => "button navigate", :text => "Previous", :id => "step_#{previous_step.directory}")
      scene.find("previous_container").add(previous_button) if scene.find_by_name("previous_button").empty?
    end

    next_step = step.exercise.next(step)
    if  !next_step.nil?
      next_button = Limelight::Prop.new(:name => "next_button", :players => "button navigate", :text => "Next", :id => "step_#{next_step.directory}")
      scene.find("next_container").add(next_button) if scene.find_by_name("next_button").empty?
    end
  end
  
  Observer.on(:load_step) do |options|
    step  = options[:step]
    scene = options[:scene]
    
    scene.find("test_source").text = step.spec
    scene.find("instructions").text = step.instructions
    scene.production.current_step = step
  end
end
