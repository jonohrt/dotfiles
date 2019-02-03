# -*- encoding: utf-8 -*-
# stub: alfredo 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "alfredo"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dennis Paagman"]
  s.date = "2013-03-24"
  s.description = "Wrapper for Alfred 2's Workflows"
  s.email = ["dennispaagman@gmail.com"]
  s.homepage = "https://github.com/springest/alfredo"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Easy generation of XML responses usable in Alfred 2 Workflows"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
  end
end
