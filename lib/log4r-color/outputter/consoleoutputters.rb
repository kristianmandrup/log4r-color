# :nodoc:
require "log4r-color/outputter/iooutputter"
require "colorize"

module Log4r
  # Same as IOOutputter(name, $stdout)
  class StdoutOutputter < IOOutputter
    def initialize(_name, hash={})
      super(_name, $stdout, hash)
    end
  end

  # Same as IOOutputter(name, $stderr)
  class StderrOutputter < IOOutputter
    def initialize(_name, hash={})
      super(_name, $stderr, hash)
    end
  end

  class ColorOutputter < IOOutputter
    def initialize(_name, hash={})
      super(_name, $stdout, hash)
    end
    
    private

    def canonical_log(logevent)
      synch { write(format(logevent), logevent.level) }
    end
    
    # perform the write
    def write(data, lv)
      begin
        key = level_key(lv)
        # puts "color key: #{key}, lv: #{lv}"
        # puts "colors: #{colors}"
        # puts "colors on key: #{colors[key]}"
        @out.print data.colorize(colors[key])
        @out.flush
        @out.print "".uncolorize
      rescue IOError => ioe # recover from this instead of crash
        Logger.log_internal {"IOError in Outputter '#{@name}'!"}
        Logger.log_internal {ioe}
        close
      rescue NameError => ne
        Logger.log_internal {"Outputter '#{@name}' IO is #{@out.class}!"}
        Logger.log_internal {ne}
        close
      end
    end    
  end
end
