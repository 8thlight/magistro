class NullReader
  def initialize(file)
    @file = file
  end
  
  def read(path)
    return ""
  end
  
  def collection(path, depth, klass, options = {})
    return []
  end
  
  def lesson_path
    return ""
  end
  
end