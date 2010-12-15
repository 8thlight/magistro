require "step_runner"
on_mouse_clicked do
  contents = scene.find('editor_input').text
  production.current_step.exercise.save_source(contents)
  runner =  production.step_runner_factory.new_runner(production.current_step)
  runner.run

  options = {:scene => scene, :step => production.current_step}
  Observer.notify(:run, options)
end