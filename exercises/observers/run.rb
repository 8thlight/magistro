Do.on(:run) do |options|
  scene = options[:scene]
  step = scene.production.current_step
  contents = scene.find('editor_input').text
  step.exercise.save_source(contents)
  runner =  scene.production.step_runner_factory.new_runner(step)
  runner.run
  Do.notify(:run_update, {:failed_count => runner.failed_count, :scene => scene, :step => step, :output => runner.output})
end