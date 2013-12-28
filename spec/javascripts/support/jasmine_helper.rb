#Use this file to set/override Jasmine configuration options
#You can remove it if you don't need it.
#This file is loaded *after* jasmine.yml is interpreted.
#
#Example: using a different boot file.
#Jasmine.configure do |config|
#   @config.boot_dir = '/absolute/path/to/boot_dir'
#   @config.boot_files = lambda { ['/absolute/path/to/boot_dir/file.js'] }
#end
#
Jasmine.configure do |config|
  config.browser = :phantomjs

  # for coffeescript
  config.boot_dir = File.expand_path('boots', File.dirname(__FILE__))
end

# monkey patch for coffeescript
module Jasmine
  def self.runner_template
    File.read(File.join(File.dirname(__FILE__), "run.html.erb"))
  end

  class CoreConfiguration
    def boot_path
      File.expand_path('boots', File.dirname(__FILE__))
    end
  end
end
