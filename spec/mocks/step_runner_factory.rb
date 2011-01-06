module Mocks
  class StepRunnerFactory
    attr_accessor :runner, :runner_count, :runners
    
    def initialize(options = {})
      @options = options
      @runner_count = 0
      @runners = []
    end
    
    def new_runner(step)
      if @runners.empty?
        @runner_count += 1
        @runner = StepRunner.new(step, @options)
        return @runner
      else
        return @runners.pop
      end
    end
  end
end