

class RspecRunner
  attr_accessor :output_stream, :error_stream, :options, :run_examples
  def initialize(options = {})
    @error_stream = StringIO.new("")
    @output_stream = StringIO.new("")
    @spec_filename = options[:filename]
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
  end
end