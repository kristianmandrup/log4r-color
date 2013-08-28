# :include: rdoc/MDC
#
# == Other Info
# 
# Version:: $Id$
# Author:: Colby Gutierrez-Kraybill <colby(at)astro.berkeley.edu>

require 'monitor'

module Log4r
  def self.mdcName
    "log4rMDC"
  end

  def mdcNameMaxDepth
    "log4rMDCMAXDEPTH"
  end

  $globalMDCLock = Monitor.new

  # See log4r-color/MDC.rb
  class MDC < Monitor
    private_class_method :new

    def self.mdcName
      Log4r.mdcName
    end

    def self.check_thread_instance
      # need to interlock here, so that if
      # another thread is entering this section
      # of code before the main thread does,
      # then the main thread copy of the MDC
      # is setup before then attempting to clone
      # it off
      if ( Thread.current[mdcName] == nil ) then
      	$globalMDCLock.synchronize do 
      	  if ( Thread.main[mdcName] == nil ) then
      	    Thread.main[mdcName] = Hash.new
      	  end

      	  if ( Thread.current != Thread.main ) then
      	    Thread.current[mdcName] = Hash.new
      	    Thread.main[mdcName].each{ |k,v| Thread.current[mdcName][k] = v }
      	  end
      	end
      end
    end

    def self.get( a_key )
      self.check_thread_instance()
      Thread.current[mdcName].fetch(a_key, "");
    end

    def self.get_context()
      self.check_thread_instance()
      return Thread.current[mdcName].clone
    end

    def self.put( a_key, a_value )
      self.check_thread_instance()
      Thread.current[mdcName][a_key] = a_value
    end

    def self.remove( a_key )
      self.check_thread_instance()
      Thread.current[mdcName].delete( a_key )
    end
  end
end
