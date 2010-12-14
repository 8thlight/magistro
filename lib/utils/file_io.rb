module Utils
  module FileIO
    
    def self.read(directory, file)
      File.read(File.join(directory, file))
    end
    
    def self.write_file(directory, filename, contents)
      filename = File.join(directory, filename)
      File.delete(filename) if File.exist?(filename)
      File.open(filename, 'a') {|file| file.write(contents)}
    end
    
  end
end