module Mocks
  class StepRunnerFactory
    attr_accessor :runner, :runner_count
    
    def initialize(options = {})
      @options = options
      @runner_count = 0
    end
    
    def new_runner(step)
      @runner_count += 1
      @runner = StepRunner.new(step, @options)
      return @runner
    end
  end
end