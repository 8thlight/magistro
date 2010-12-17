
module Traverse
  module Directory

    def collect(dir, klass)
      collection = []
      Dir.entries(@directory).sort.each_with_index do |entry, index|
        filename = File.join(@directory, entry)
        collection << klass.new(filename) if File.directory?(filename) && ![".", "..", "chapter"].include?(entry)
      end
      return collection

    end
  end
  
end