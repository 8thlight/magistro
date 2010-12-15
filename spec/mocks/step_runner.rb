module Mocks
  
  class StepRunner
    @@failed_count = 0
    def self.failed_count=(value)
      @@failed_count = value
    end
    
    @@output = ""
    def self.failed_count=(value)
      @@output = value
    end
    
    attr_accessor :step, :failed_count, :output
    def initialize(step)
      @step = step
      @failed_count = @@failed_count
      @output = @@output
    end
    
    def run
    end
  end
end