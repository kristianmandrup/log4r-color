class TestLogger < TestCase
  def test_color_outputter
    l = Logger.new 'colorizer'
    l.level = WARN      
    color_outputter = ColorOutputter.new 'so2', :colors => {:info => {:color => :color => :light_blue, :background => :red}, :debug => :light_blue }
    l.outputters << color_outputter
    assert_no_exception {
      l.debug { puts "should not show up"; "LOGBLOCKS" }
      l.warning { puts "should show up"; "LOGBLOCKS" }
      l.info { puts "should show up"; "LOGBLOCKS" }
    }    
  end
end

