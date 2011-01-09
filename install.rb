require 'rbconfig'
require 'find'
require 'ftools'

include Config

# this was adapted from rdoc's install.rb (I hope Dave doesn't mind :)

$sitedir = CONFIG["sitelibdir"]
unless $sitedir
  version = CONFIG["MAJOR"] + "." + CONFIG["MINOR"]
  $libdir = File.join(CONFIG["libdir"], "ruby", version)
  $sitedir = $:.find {|x| x =~ /site_ruby/ }
  if !$sitedir
    $sitedir = File.join($libdir, "site_ruby")
  elsif $sitedir !~ Regexp.quote(version)
    $sitedir = File.join($sitedir, version)
  end
end

makedirs = %w{ log4r-color/outputter log4r-color/formatter log4r-color/lib}
makedirs.each {|f| File::makedirs(File.join($sitedir, *f.split(/\//)))}

# deprecated files that should be removed
deprecated = %w{
 log4r-color/formatter.rb
 log4r-color/outputter.rb
 log4r-color/outputters.rb
 log4r-color/outputterfactory.rb
 log4r-color/patternformatter.rb
}

# files to install in library path
files = %w{
 log4r-color.rb
 log4r-color/base.rb
 log4r-color/config.rb
 log4r-color/configurator.rb
 log4r-color/yamlconfigurator.rb
 log4r-color/logevent.rb
 log4r-color/logger.rb
 log4r-color/loggerfactory.rb
 log4r-color/logserver.rb
 log4r-color/repository.rb
 log4r-color/staticlogger.rb
 log4r-color/outputter/consoleoutputters.rb
 log4r-color/outputter/emailoutputter.rb
 log4r-color/outputter/fileoutputter.rb
 log4r-color/outputter/rollingfileoutputter.rb
 log4r-color/outputter/iooutputter.rb
 log4r-color/outputter/outputter.rb
 log4r-color/outputter/outputterfactory.rb
 log4r-color/outputter/remoteoutputter.rb
 log4r-color/outputter/scribeoutputter.rb
 log4r-color/outputter/staticoutputter.rb
 log4r-color/outputter/syslogoutputter.rb
 log4r-color/formatter/formatter.rb
 log4r-color/formatter/patternformatter.rb
 log4r-color/lib/xmlloader.rb
 log4r-color/lib/drbloader.rb
}

# the acual gruntwork
Dir.chdir("lib")
File::safe_unlink *deprecated.collect{|f| File.join($sitedir, f.split(/\//))}
files.each {|f| 
  File::install(f, File.join($sitedir, *f.split(/\//)), 0644, true)
}
