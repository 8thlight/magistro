require "step_runner"
on_mouse_clicked do
  options = {:scene => scene, :step => production.current_step}
  Observer.notify(:run, options)
end