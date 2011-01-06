class DirectoryReader
  
  def initialize(root_dir)
    @dir = root_dir
  end
  
  def read(path)
    return File.read(File.join(path))
  end
  
  def collection(path, depth, klass, options = {})
    collection = []
    Dir.entries(File.join(path)).sort.each do |entry|
      filename = File.join(path, entry)
      collection << klass.new(entry, options) if File.directory?(filename) && ![".", "..", "chapter"].include?(entry)
    end
    return collection
  end
  
  def lesson_path
    return @dir
  end
    
end