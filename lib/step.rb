require "spec"

class Step
  attr_accessor :options, :error_stream, :output_stream, :run_examples

  def initialize(options = {})
    @directory = File.expand_path(options[:directory])
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
    @options.files << spec_filename
    if !@run_examples
      @options.examples_should_not_be_run
    end
    Spec::Runner.use @options
    @options.run_examples
  rescue Exception => e
    puts e.message
    puts e.backtrace
  end

  def read(file)
    File.read(File.join(@directory, file))
  end

  def instructions
    file = "instructions"
    read(file)
  end

  def spec_filename
    files = Dir.glob(File.join(@directory, "*_spec.rb"))
    return files.first
  end

  def spec
    read(File.basename(spec_filename))
  end
  
end