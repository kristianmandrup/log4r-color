# :nodoc:
require "log4r-color/config"

module Log4r
  class << self
    attr_writer :all
    def all
      0
    end

    attr_writer :lnames
    def lNames 
      ['ALL']
    end
  end

  # Defines the log levels of the Log4r module at runtime. It is given
  # either the default level spec (when root logger is created) or the
  # user-specified level spec (when Logger.custom_levels is called).
  #
  # The last constant defined by this method is OFF. Other level-sensitive 
  # parts of the code check to see if OFF is defined before deciding what 
  # to do. The typical action would be to force the creation of RootLogger 
  # so that the custom levels get loaded and business can proceed as usual.
  #
  # For purposes of formatting, a constant named MaxLevelLength is defined
  # in this method. It stores the max level name string size.

  def Log4r.define_levels(*levels) #:nodoc:
    return if const_defined? :OFF
    for i in 0...levels.size
      name = levels[i].to_s
      module_eval "#{name} = #{i} + 1; lNames.push '#{name}'"
    end
    module_eval %{
      lNames.push 'OFF'
      levels = lNames.size
      off = levels - 1
      MaxLevelLength = Log4rTools.max_level_str_size
    }
  end

  # Some common functions 
  class Log4rTools
    # Raises ArgumentError if level argument is an invalid level. Depth
    # specifies how many trace entries to remove.
    def self.validate_level(level, depth=0)
      unless valid_level?(level)
        raise ArgumentError, "Log level must be in 0..#{LEVELS}",
              caller[1..-(depth + 1)]
      end
    end
    
    def self.valid_level?(lev)
      not lev.nil? and lev.kind_of?(Numeric) and lev >= ALL and lev <= OFF
    end
    
    def self.max_level_str_size #:nodoc:
      size = 0
      lNames.each {|i| size = i.length if i.length > size}
      size
    end

    def self.validate_colors(colors)      
      raise ArgumentError, "Colors option must consist of a hash where each key is the log level to define a color scheme for" if !colors.kind_of? Hash
      invalid_levels = colors.keys.reject {|level| valid_levels.include? level}
      if !invalid_levels.empty?
        raise ArgumentError, "Color schemes cannot be defined for these invalid log levels: #{invalid_levels.join(', ')}"
      end
    end

    def self.level_key level 
      valid_levels[level]
    end

    def self.valid_levels
      lNames.collect { |level| level.downcase.to_sym }
    end
  
    # Shortcut for decoding 'true', 'false', true, false or nil into a bool
    # from a hash parameter. E.g., it looks for true/false values for
    # the keys 'symbol' and :symbol.

    def self.decode_bool(hash, symbol, default)
      data = hash[symbol]
      data = hash[symbol.to_s] if data.nil?
      return case data
        when 'true',true then true
        when 'false',false then false
        else default
        end
    end

    # Splits comma-delimited lists with arbitrary \s padding
    def self.comma_split(string)
      string.split(/\s*,\s*/).collect {|s| s.strip}
    end
  end
end
