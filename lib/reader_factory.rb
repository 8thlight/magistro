require "directory_reader"
require "jar_reader"
require "null_reader"

class ReaderFactory
  def self.create(file)
    return DirectoryReader.new(file) if File.directory?(file)
    return JarReader.new(file) if File.file?(file) && File.extname(file) == ".jar"
    return NullReader.new(file)
  end
end