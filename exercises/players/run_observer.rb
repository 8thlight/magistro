class RunObserver
  @@observers = []
  def self.on_run(&block)
    @@observers << block
  end
  
  def self.notify(fail_count, scene)
    @@observers.each {|observer| observer.call(fail_count, scene)}
  end
end
