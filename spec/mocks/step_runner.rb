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
    
    def failures?
      return false if @failed_count.nil?
      return @failed_count > 0
    end
    
  end
end