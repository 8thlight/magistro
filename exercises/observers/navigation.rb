Observer.on([:run_update, :load_step]) do |options|
  scene  = options[:scene]
  step   = options[:step]
  
  previous_step = step.exercise.previous(step)
  scene.find("previous_container").remove_all
  if  !previous_step.nil?
    previous_button = Limelight::Prop.new(:name => "previous_button", :players => "button navigate", :text => "Previous", :id => "step_#{previous_step.position}")
    scene.find("previous_container").add(previous_button) if scene.find_by_name("previous_button").empty?
  end

  next_step = step.exercise.next(step)
  scene.find("next_container").remove_all
  if !next_step.nil?
    next_button = Limelight::Prop.new(:name => "next_button", :players => "button navigate", :text => "Next", :id => "step_#{next_step.position}")
    scene.find("next_container").add(next_button) if scene.find_by_name("next_button").empty?
  end
end
