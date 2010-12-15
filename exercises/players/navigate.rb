
on_mouse_clicked do
  directory = self.id.gsub(/step_/, "")
  
  options = {:scene => scene, :step => Step.new(:directory => directory)}
  Observer.notify(:load_step, options)
end