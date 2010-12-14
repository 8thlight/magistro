

class Step

  def initialize(options = {})
    @directory = File.expand_path(options[:directory])
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

  def save_source(contents)
    write_file("source.rb", contents)
  end

  def source
    read("source.rb")
  end

  private #################


  def write_file(filename, contents)
    filename = File.join(@directory, filename)
    File.delete(filename) if File.exist?(filename)
    File.open(filename, 'a') {|file| file.write(contents)}
  end

end