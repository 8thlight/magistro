class DirectoryReader
  
  def read(path)
    return File.read(File.join(path))
  end
  
  def collection(path, klass, options = {})
    collection = []
    Dir.entries(File.join(path)).sort.each do |entry|
      filename = File.join(path, entry)
      collection << klass.new(entry, options) if File.directory?(filename) && ![".", "..", "chapter"].include?(entry)
    end
    return collection
  end
    
end