Observer.on(:load_step) do |options|
  step  = options[:step]
  scene = options[:scene]
  
  scene.find("test_source").text = step.spec
  scene.find("instructions").text = step.instructions
  scene.production.current_step = step
end
