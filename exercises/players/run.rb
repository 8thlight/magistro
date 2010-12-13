require "rspec_runner"
on_mouse_clicked do
  contents = scene.find('editor_input').text
  production.current_step.save_source(contents)
  runner = RspecRunner.new(production.current_step.spec_filename)
  runner.run
  scene.find("output").text = production.current_step.output_stream
end