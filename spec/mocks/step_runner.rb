module Mocks
    
  class StepRunner
    attr_accessor :step, :failed_count, :output
    def initialize(step, options = {})
      @step = step
      @failed_count = options[:failed_count]
      @output = options[:output]
      @ran = false
    end
    
    def run
      @ran = true
    end
    
    def ran?
      return @ran
    end
  end
end