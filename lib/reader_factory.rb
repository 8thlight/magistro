class ReaderFactory
  def self.create(directory)
    return DirectoryReader.new(directory) if File.directory?(directory)
    return JarReader.new(directory)
  end
end