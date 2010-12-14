require "step_runner"
on_mouse_clicked do
  contents = scene.find('editor_input').text
  production.current_step.save_source(contents)
  runner =  StepRunner.new(production.current_step)
  runner.run
  fail_count = runner.failed_count
  scene.find("failure_count").text = "#{fail_count} failure"
  scene.find("output").text = runner.output
  tests_prop = scene.find("tests")
  if fail_count == 0
    tests_prop.style.background_color = "335003"
    tests_prop.style.secondary_background_color = "618108"
  else
    tests_prop.style.background_color = "ff0300"
    tests_prop.style.secondary_background_color = "b1212b"
  end
end