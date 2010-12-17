class Browser
  def self.show_in_browser(url)
    os = java.lang.System.getProperty("os.name").downcase
    rt = java.lang.Runtime.getRuntime()
    begin
       if os.include?( "win" )
         cmd = []
         cmd[0] = "cmd.exe"
         cmd[1] = "/C"
         cmd[2] = "start"
         cmd[3] = url
         rt.exec(cmd)
       elsif os.include?( "mac" )
           rt.exec( "open " + url)
       else
         browsers = ["epiphany", "firefox", "mozilla", "konqueror", "netscape","opera","links","lynx"]

         browsers.each_index do |browser, index|
           cmd << ((i==0  ? "" : " || " ) + browser + " \"" + url + "\" ")
         end

         rt.exec(["sh", "-c", cmd.toString() ])
      end
      
    rescue Exception => e
      puts e.message
      puts e.backtrace
    end
  end
end

