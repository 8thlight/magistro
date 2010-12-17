Observer.on(:run_update) do |options|
  failed_count = options[:failed_count]
  scene = options[:scene]
  output = options[:output]
  
  scene.find("failure_count").text = "#{failed_count} failure"
  scene.find("output").text = output
end