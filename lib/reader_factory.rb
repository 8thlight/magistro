class ReaderFactory
  def self.create(file)
    return DirectoryReader.new(file) if File.directory?(file)
    return JarReader.new(file)
  end
end