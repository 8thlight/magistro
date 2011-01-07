Do.on(:load_step) do |options|
  step  = options[:step]
  scene = options[:scene]
  
  scene.find("test_source").text = step.spec
  scene.find("instructions").text = step.instructions
  scene.find("editor_input").text = step.exercise.source
  scene.production.current_step = step
end
