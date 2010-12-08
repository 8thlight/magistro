on_mouse_clicked do
  production.current_exercise.run
  scene.find("output").text = production.current_exercise.output_stream.string
end