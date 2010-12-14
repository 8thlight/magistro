require "step"
require "rspec"
require "rspec/core/formatters/base_text_formatter"
require "rspec/core/reporter"

class TestSpace < Module
end


class StepRunner
  attr_accessor :test_space, :formatter
  def initialize(step)
    @step = step
    @errors = StringIO.new("")
    @output = StringIO.new("")
    @formatter = RSpec::Core::Formatters::BaseTextFormatter.new(@output)
    @reporter = RSpec::Core::Reporter.new(@formatter)
  end

  def run
    @test_space = TestSpace.new
    @test_space.module_eval(@step.exercise.source)
    
    @test_space.const_set("REPORTER", @reporter)
    @test_space.module_eval("require \"rspec/matchers\"")
    @test_space.module_eval("require \"rspec/expectations\"")
    @test_space.module_eval("def self.description_block;return @@description_block;end;")
    @test_space.module_eval("@@description_block = #{@step.spec};")
    @test_space.module_eval("def self.run;@@description_block.run(REPORTER);end;")
    @test_space.run
    @formatter.dump_failures
  end


  def failed_count
    return @formatter.failed_examples.size
  end

  def errors
    return @errors.string
  end

  def output
    return @output.string
  end
end