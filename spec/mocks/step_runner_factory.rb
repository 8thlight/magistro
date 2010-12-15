module Mocks
  class StepRunnerFactory
    attr_accessor :runner
    def initialize(options = {})
      @options = options
    end
    def new_runner(step)
      @runner = StepRunner.new(step, @options)
      return @runner
    end
  end
end