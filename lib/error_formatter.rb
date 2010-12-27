module ErrorFormatter
  def self.format(input)
    return input.gsub(/#<Module:([A-Za-z0-9]+)>::/, "")
  end
end
