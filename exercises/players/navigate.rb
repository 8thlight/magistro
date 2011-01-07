on_mouse_clicked do
  position = self.id.gsub(/step_/, "").to_i
  
  #TODO - PWP - make step = exercise.step(postion)
  my_step = nil
  production.current_exercise.steps.each do |step|
    my_step = step if step.position == position
  end
  
  options = {:scene => scene, :step => my_step}
  Do.notify(:load_step, options)
  Do.notify(:run, options)
end