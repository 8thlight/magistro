require "exercise"
class JarReader
  
  def initialize(jar_filename)
    @filename = jar_filename
    @jar = java.util.jar.JarFile.new(@filename)
  end
  
  def read(path)
    convert_to_string(@jar.get_input_stream(path.join("/")))
  end
  
  def collection(path, depth, klass, options = {})
    collection = []
    @jar.entries.each do |entry|
      if klass_candidate?(entry)
        path_pieces = entry.name.gsub(Regexp.new("#{path}/"), "").split("/")        
        if path_pieces.size == depth       
          collection << klass.new(path_pieces.last, options) 
        end
      end
    end
    return collection
  end  
  
  
  def lesson_path
    return @filename.split('/').last.gsub(/.jar/, "")
  end
  
  private ######################################
  
  def klass_candidate?(entry)
    return (entry.directory? && !entry.name.include?("chapter") && !entry.name.include?("META-INF"))
  end
  
  def convert_to_string(input)
    return "" if input.nil?
    br = java.io.BufferedReader.new(java.io.InputStreamReader.new(input, "UTF-8"))
    builder = java.lang.StringBuilder.new(5000)
    begin
      line=br.readLine
      while (!line.nil?) do
        builder.append("#{line}\n")
        line=br.readLine
      end
    rescue Exception => e
      puts e
    end
    return builder.toString()
  end
  
end