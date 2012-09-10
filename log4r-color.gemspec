# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{log4r-color}
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Colby Gutierrez-Kraybill, Kristian Mandrup (color outputter)"]
  s.date = %q{2012-09-09}
  s.description = %q{See also: http://logging.apache.org/log4j}
  s.email = %q{colby@astro.berkeley.edu, kmandrup@gmail.com}
  s.extra_rdoc_files = ["README.textile", "LICENSE", "TODO"]
  s.files = ["LICENSE", "LICENSE.LGPLv3", "README.textile", "INSTALL", "Rakefile", "TODO", "doc/content", "doc/content/contact.html", "doc/content/contribute.html", "doc/content/index.html", "doc/content/license.html", "doc/content/manual.html", "doc/dev", "doc/dev/checklist", "doc/dev/README.developers", "doc/dev/things-to-do", "doc/images", "doc/images/log4r-logo.png", "doc/images/logo2.png", "doc/log4r.css", "doc/rdoc-log4r.css", "doc/templates", "doc/templates/main.html", "examples/ancestors.rb", "examples/chainsaw_settings.xml", "examples/color_output.rb", "examples/customlevels.rb", "examples/filelog.rb", "examples/fileroll.rb", "examples/gmail.rb", "examples/gmail.yaml", "examples/log4r_yaml.yaml", "examples/logclient.rb", "examples/logserver.rb", "examples/moderate.xml", "examples/moderateconfig.rb", "examples/myformatter.rb", "examples/outofthebox.rb", "examples/rdoc-gen", "examples/README", "examples/rrconfig.xml", "examples/rrsetup.rb", "examples/simpleconfig.rb", "examples/syslogcustom.rb", "examples/xmlconfig.rb", "examples/yaml.rb", "lib/log4r-color", "lib/log4r-color/base.rb", "lib/log4r-color/config.rb", "lib/log4r-color/configurator.rb", "lib/log4r-color/formatter", "lib/log4r-color/formatter/formatter.rb", "lib/log4r-color/formatter/log4jxmlformatter.rb", "lib/log4r-color/formatter/patternformatter.rb", "lib/log4r-color/GDC.rb", "lib/log4r-color/lib", "lib/log4r-color/lib/drbloader.rb", "lib/log4r-color/lib/xmlloader.rb", "lib/log4r-color/logevent.rb", "lib/log4r-color/logger.rb", "lib/log4r-color/loggerfactory.rb", "lib/log4r-color/logserver.rb", "lib/log4r-color/MDC.rb", "lib/log4r-color/NDC.rb", "lib/log4r-color/outputter", "lib/log4r-color/outputter/consoleoutputters.rb", "lib/log4r-color/outputter/datefileoutputter.rb", "lib/log4r-color/outputter/emailoutputter.rb", "lib/log4r-color/outputter/fileoutputter.rb", "lib/log4r-color/outputter/iooutputter.rb", "lib/log4r-color/outputter/outputter.rb", "lib/log4r-color/outputter/outputterfactory.rb", "lib/log4r-color/outputter/remoteoutputter.rb", "lib/log4r-color/outputter/rollingfileoutputter.rb", "lib/log4r-color/outputter/scribeoutputter.rb", "lib/log4r-color/outputter/staticoutputter.rb", "lib/log4r-color/outputter/syslogoutputter.rb", "lib/log4r-color/outputter/udpoutputter.rb", "lib/log4r-color/rdoc", "lib/log4r-color/rdoc/configurator", "lib/log4r-color/rdoc/emailoutputter", "lib/log4r-color/rdoc/formatter", "lib/log4r-color/rdoc/GDC", "lib/log4r-color/rdoc/log4r", "lib/log4r-color/rdoc/logger", "lib/log4r-color/rdoc/logserver", "lib/log4r-color/rdoc/MDC", "lib/log4r-color/rdoc/NDC", "lib/log4r-color/rdoc/outputter", "lib/log4r-color/rdoc/patternformatter", "lib/log4r-color/rdoc/scribeoutputter", "lib/log4r-color/rdoc/syslogoutputter", "lib/log4r-color/rdoc/win32eventoutputter", "lib/log4r-color/rdoc/yamlconfigurator", "lib/log4r-color/repository.rb", "lib/log4r-color/staticlogger.rb", "lib/log4r-color/yamlconfigurator.rb", "lib/log4r-color.rb", "tests/README", "tests/testall.rb", "tests/testbase.rb", "tests/testchainsaw.rb", "tests/testcoloroutput.rb", "tests/testconf.xml", "tests/testcustom.rb", "tests/testformatter.rb", "tests/testGDC.rb", "tests/testlogger.rb", "tests/testMDC.rb", "tests/testNDC.rb", "tests/testoutputter.rb", "tests/testpatternformatter.rb", "tests/testthreads.rb", "tests/testxmlconf.rb"]
  s.homepage = %q{http://log4r.rubyforge.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{log4r-color}
  s.rubygems_version = %q{1.5.3}
  s.summary = %q{Log4r, logging framework for ruby}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<scribe>, [">= 0"])
      s.add_runtime_dependency(%q<colorize>, [">= 0"])
    else
      s.add_dependency(%q<scribe>, [">= 0"])
      s.add_dependency(%q<colorize>, [">= 0"])
    end
  else
    s.add_dependency(%q<scribe>, [">= 0"])
    s.add_dependency(%q<colorize>, [">= 0"])
  end
end
