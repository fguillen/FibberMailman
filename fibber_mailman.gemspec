# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fibber_mailman}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["http://fernandoguillen.info"]
  s.date = %q{2010-08-02}
  s.description = %q{FibberMailman lie to you when you ask for a Net::POP3.start call.}
  s.email = %q{fguillen.mail@gmail.com}
  s.extra_rdoc_files = ["README.md", "lib/fibber_mailman.rb"]
  s.files = ["README.md", "Rakefile", "lib/fibber_mailman.rb", "test/fibber_mailman_test.rb", "test/fixtures/mail1.raw_mail", "test/fixtures/mail2.raw_mail", "Manifest", "fibber_mailman.gemspec"]
  s.homepage = %q{http://github.com/fguillen/FibberMailman}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Fibber_mailman", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{fibber_mailman}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{FibberMailman lie to you when you ask for a Net::POP3.start call.}
  s.test_files = ["test/fibber_mailman_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<net/pop>, [">= 0"])
      s.add_development_dependency(%q<tmail>, [">= 0"])
      s.add_development_dependency(%q<test/unit>, [">= 0"])
    else
      s.add_dependency(%q<net/pop>, [">= 0"])
      s.add_dependency(%q<tmail>, [">= 0"])
      s.add_dependency(%q<test/unit>, [">= 0"])
    end
  else
    s.add_dependency(%q<net/pop>, [">= 0"])
    s.add_dependency(%q<tmail>, [">= 0"])
    s.add_dependency(%q<test/unit>, [">= 0"])
  end
end
