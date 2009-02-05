# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{semi-formal}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Nakajima"]
  s.date = %q{2009-01-22}
  s.email = %q{patnakajima@gmail.com}
  s.files = ["lib/core_ext", "lib/core_ext/module.rb", "lib/core_ext/object.rb", "lib/semi_formal", "lib/semi_formal/builder.rb", "lib/semi_formal/form.rb", "lib/semi_formal/input.rb", "lib/semi_formal.rb"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Forms when you need 'em}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 0"])
  end
end
