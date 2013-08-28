# :include: rdoc/NDC
#
# == Other Info
# 
# Version:: $Id$
# Author:: Colby Gutierrez-Kraybill <colby(at)astro.berkeley.edu>

module Log4r
  
  def self.ndcName
    "log4rNDC"
  end

  def self.ndcNameMaxDepth
    "log4rNDCMAXDEPTH"
  end

  def self.ndcDefaultMaxDepth
    256
  end

  # See log4r-color/NDC.rb
  class NDC
    private_class_method :new

    def self.ndcName
      Log4r.ndcName
    end

    def self.ndcNameMaxDepth
      Log4r.ndcNameMaxDepth
    end

    def self.ndcDefaultMaxDepth
      Log4r.ndcDefaultMaxDepth
    end

    def self.check_thread_instance()
      if ( Thread.current[ndcName] == nil ) then
      	Thread.current[ndcName] = Array.new
      	Thread.current[ndcNameMaxDepth] = ndcDefaultMaxDepth
      end
    end

    def self.clear()
      self.check_thread_instance()
      Thread.current[ndcName].clear
    end

    def self.clone_stack()
      self.check_thread_instance()
      return Thread.current[ndcName].clone
    end

    def self.get_depth()
      self.check_thread_instance()
      return Thread.current[ndcName].length
    end

    def self.inherit( a_stack )
      if ( a_stack.class == Array ) then
      	if ( Thread.current[ndcName] != nil ) then
      	  Thread.current[ndcName].clear
      	  Thread.current[ndcName] = nil
      	end
      	Thread.current[ndcName] = a_stack
      else
	      raise "Expecting Array in NDC.inherit"
      end
    end

    def self.get()
      self.check_thread_instance
      return Thread.current[ndcName] * " "
    end

    def self.peek()
      self.check_thread_instance()
      return Thread.current[ndcName].last
    end

    def self.pop()
      self.check_thread_instance()
      return Thread.current[ndcName].pop
    end

    def self.push( value )
      self.check_thread_instance()
      if ( Thread.current[ndcName].length < Thread.current[ndcNameMaxDepth] ) then
	      Thread.current[ndcName].push( value )
      end
    end

    def self.remove()
      self.check_thread_instance()
      Thread.current[ndcName].clear
      Thread.current[ndcNameMaxDepth] = nil
      Thread.current[ndcName] = nil
    end

    def self.set_max_depth( max_depth )
      self.check_thread_instance()
      Thread.current[ndcNameMaxDepth] = max_depth
    end
  end
end

