require "directory_model"

class Chapter < DirectoryModel
  readable_attribute :title, :contents
  modified_attribute :resources, :split, "\n"  
end