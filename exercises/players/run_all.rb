on_mouse_clicked do
  options = {:scene => scene, :exercise => production.current_exercise}
  Do.notify(:run_all, options)
end