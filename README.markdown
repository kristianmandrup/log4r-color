# Log4r-color - A flexible logging library for Ruby

This release is currently decoupled from the main _log4r_ project. The main addition in this project is the _ColorOutputter_ using colorize to display logs in the console/terminal with colorschemes for each log level.

## Release

This release:      *1.2*
Release date:      *Jan/2011*
License:           LGPLv3
Maintainer:        Kristian Mandrup

## Contributors      

* Colby Gutierrez-Kraybill
* Leon Torres - Original Maintainer
* Martain Stannard - RollingFileOutputter
* Steve Lumos - SyslogOutputter
* Mark Lewandowski - ScribeOutputter
* Andreas Hund - YamlConfigurator
* Jamis Buck - log4r.gemspec
* Charles Strahan - log4jxml/chainsaw integration
* Nitay Joffe - STARTTLS
* David Siegal - Smart updates to RollingFileOutputter

[[Homepage|http://log4r.rubyforge.org/]]
[[Download|http://rubyforge.org/frs/?group_id=203]]

## Summary

Log4r is a comprehensive and flexible logging library written in Ruby for use 
in Ruby programs. It features a hierarchical logging system of any number of 
levels, custom level names, logger inheritance, multiple output destinations 
per log event, execution tracing, custom formatting, thread safteyness, XML 
and YAML configuration, and more.


## Requirements

* (required) Ruby >= 1.7.0 (use log4r 1.0.2 for Ruby 1.6)
* (optional) RubyGems for installing Log4r as a gem
* (optional) Ruby syslog library for SyslogOutputter
* (optional) XML configuration requires REXML
* (optional) log4j chainsaw integration requires 'builder' >= 2.0
* (optional) STARTTLS email login, requires 'smtp_tls" if Ruby <= 1.8.6

### Gem requirements

* colorize
* scribe

## Install

<code>gem install log4r-color</code>

## Usage

Here is an example of setting up a logger with ColorOutputter using a color scheme. While logging, one of the color schemes is changed and it applies immediately to the following log messages. 


```ruby
authorize!(params[:action], @product || Product)
```

```ruby
require 'log4r-color'
include Log4r

Logger.global.level = ALL
formatter = PatternFormatter.new(:pattern => "%l - %m - %c")

ColorOutputter.new 'color', {:colors => {:debug => :light_blue, :info => :light_blue, :warn => :yellow, :error => :red, :fatal => {:color => :red, :background => :white} } }

Logger.new('color_logger', DEBUG).add('color')

def do_logging(log)
  puts "--"
  log.debug "This is debug"
  log.info "This is info"
  log.warn "This is warn"
  Outputter['color'].colors[:info] = :green
  log.info "This is info again, now in green"
  log.error "This is error"
  log.fatal "This is fatal"  
end

do_logging Logger['color_logger']
```

## More Info

* Installation instructions are in the file INSTALL

* Comprehensive examples are provided in examples/ and can be run right away

* Log4r homepage: doc/index.html
  Online: http://log4r.rubyforge.org/

* Manual: doc/manual.html
  Online: http://log4r.rubyforge.org/manual.html
  
* RDoc API reference: doc/rdoc/index.html 
  Online: http://log4r.rubyforge.org/rdoc/index.html
  
* The changelog

* Log4r is hosted by RubyForge, which provides news, bug tracking and a forum

* Feel free to bug the maintainer with any questions (listed at top of file)


## Usability

Log4r works really well, so please take advantage of it right away! :)
All versions since 0.9.2 have been stable and backward-compatible. The
code is stable enough that updates are infrequent and usually only for
adding features or keeping the code up to date with Ruby.


## Platform Issues

Log4r is known to work on Linux and WindowsXP. It's safe to assume that Log4r 
will work on any Ruby-supported platform.


## When Trouble Strikes

Log4r comes with an internal logger. To see its output, create a logger
named 'log4r' before any others and give it a suitable outputter,
<pre>  trouble = Logger.new['log4r']
  trouble.add Outputter.stdout  
</pre>


