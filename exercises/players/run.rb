require "step_runner"
on_mouse_clicked do
  contents = scene.find('editor_input').text
  production.current_step.save_source(contents)
  runner =  StepRunner.new(production.current_step)
  runner.run
  scene.find("failure_count").text = "#{runner.failed_count} failure"
  scene.find("output").text = runner.output
end