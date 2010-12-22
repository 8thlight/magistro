module StepNavigation
  
  def next(current_step)
    steps.each_with_index do |step_candidate, index|
      return steps[index + 1] if current_step.position == step_candidate.position && index < steps.size - 1
    end
    return nil
  end
  
  def previous(step)
    steps.each_with_index do |step_candidate, index|
      return steps[index - 1] if step.position == step_candidate.position && (index - 1) >= 0
    end
    return nil
  end
  
end