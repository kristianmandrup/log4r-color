# :nodoc:
# Version:: $Id$

module Log4r
  module Log4rConfig #:nodoc:

    class << self
      attr_writer :logLevels
      def logLevels
        ['DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL']
      end
      
      attr_writer :loggerPathDelimiter
      def loggerPathDelimiter
        '::'
      end
    end
  end    
end
