on_mouse_clicked do
  options = {:scene => scene, :step => production.current_step}
  Do.notify(:run, options)
end