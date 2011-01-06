on_mouse_clicked do
  options = {:scene => scene, :exercise => production.current_exercise}
  Observer.notify(:run_all, options)
end