require "spec"

class Exercise
  attr_accessor :spec_filename, :options, :error_stream, :output_stream, :run_examples

  def initialize(options = {})
    @spec_filename = options[:spec_filename]
    @error_stream = StringIO.new("")
    @output_stream = StringIO.new("")
    if options[:run_examples].nil?
      @run_examples = true
    else
      @run_examples = options[:run_examples]
    end
  end
  
  def run
    @options = Spec::Runner::Options.new(@error_stream, @output_stream)
    @options.files << @spec_filename
    if !@run_examples
      @options.examples_should_not_be_run
    end
    Spec::Runner.use @options
    @options.run_examples
  rescue Exception => e
    puts e.message
    puts e.backtrace
  end
  
end