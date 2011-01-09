$: << File.join("..","lib")

require 'rubygems'

require 'log4r-color'
include Log4r

Logger.global.level = ALL
formatter = PatternFormatter.new(:pattern => "%l - %m - %c")

ColorOutputter.new 'color', {:colors => {:debug => :light_blue, :info => {:color => :light_blue, :background => :white}, :warn => :yellow, :error => :red, :fatal => {:color => :red, :background => :white} } }

Logger.new('color_logger', DEBUG).add('color')


def do_logging(log)
  puts "--"
  log.debug "This is debug"
  log.info "This is info"
  log.warn "This is warn"
  Outputter['color'].colors[:info] = :green
  log.info "This is info again"
  log.error "This is error"
  log.fatal "This is fatal"
  
end

# This logger is configured to log at FATAL, and it does
do_logging Logger['color_logger']