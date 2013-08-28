# :include: log4r-color/rdoc/log4r
#
# == Other Info
#
# Author::      Leon Torres
# Version::     $Id$

require "log4r-color/outputter/fileoutputter"
require "log4r-color/outputter/consoleoutputters"
require "log4r-color/outputter/staticoutputter"
require "log4r-color/outputter/rollingfileoutputter"
require "log4r-color/formatter/patternformatter"
require "log4r-color/loggerfactory"
require "log4r-color/GDC"
require "log4r-color/NDC"
require "log4r-color/MDC"

module Log4r
  def self.log4rVersion
    "1.3"
  end
end
