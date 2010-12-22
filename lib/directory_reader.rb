class DirectoryReader
  attr_accessor :source_name
  
  def initialize(directory)
    @name = File.expand_path(directory)
  end
  
  def read(path)
    return File.read(File.join(path))
  end
  
  def collection(path, klass, reader, parent)
    collection = []
    Dir.entries(File.join(path)).sort.each do |entry|
      filename = File.join(path, entry)
      collection << klass.new(entry, {:parent => parent, :reader => reader}) if File.directory?(filename) && ![".", "..", "chapter"].include?(entry)
    end
    return collection
  end
    
end