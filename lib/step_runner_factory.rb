class StepRunnerFactory
  def new_runner(step)
    return StepRunner.new(step)
  end
end
