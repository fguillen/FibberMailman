# -*- encoding: utf-8 -*-
$:.push File.expand_path( "#{__FILE__}/../lib" )
require "fibber_mailman/version"

Gem::Specification.new do |s|
  s.name        = "fibber_mailman"
  s.version     = FibberMailman::VERSION
  s.authors     = ["Fernando Guillen"]
  s.email       = ["fguillen.mail@gmail.com"]
  s.homepage    = "https://github.com/fguillen/FibberMailman"
  s.summary     = "FibberMailman lie to you when you ask for a Net::POP3.start call."
  s.description = "FibberMailman lie to you when you ask for a Net::POP3.start call."

  s.rubyforge_project = "FibberMailman"
    
  s.add_development_dependency "rake"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end