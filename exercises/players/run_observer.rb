class RunObserver
  @@observers = []
  def self.register(observer)
    @@observers << observer
  end
  
  def self.notify(fail_count, scene)
    @@observers.each {|observer| observer.call(fail_count, scene)}
  end
end
