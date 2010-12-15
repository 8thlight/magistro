require "step_runner"
require File.expand_path(File.dirname(__FILE__) + "/run_observer")

on_mouse_clicked do
  contents = scene.find('editor_input').text
  production.current_step.exercise.save_source(contents)
  runner =  production.step_runner_factory.new_runner(production.current_step)
  runner.run
  RunObserver.notify(runner, scene)
end