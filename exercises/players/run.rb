require "rspec_runner"
on_mouse_clicked do
  contents = scene.find('editor_input').text
  production.current_step.save_source(contents)
  runner = RspecRunner.new(:filename => production.current_step.spec_filename)
  runner.run
  if runner.output_stream.string.empty?
    scene.find("output").text = runner.error_stream.string
  else
    scene.find("output").text = runner.output_stream.string
  end

end