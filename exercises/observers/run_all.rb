Do.on(:run_all) do |options|
  scene = options[:scene]
  exercise = options[:exercise]
  if !scene.production.current_lesson.nil? && scene.production.current_lesson.reader.class != NullReader
    contents = scene.find('editor_input').text
    exercise.save_source(contents)
  
    exercise.steps.each do |step|
      runner =  scene.production.step_runner_factory.new_runner(step)
      runner.run
      if runner.failures?
        scene.production.current_step = step
      
        Do.notify(:run_update, {:failed_count => runner.failed_count, :scene => scene, :step => step, :output => runner.output})
        Do.notify(:load_step, {:scene => scene, :step => step})
        break
      end
    end 
  end
  
end