# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rat-hole}
  s.version = "0.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Hale", "David Bogus", "Nathaniel Talbott"]
  s.date = %q{2010-01-12}
  s.description = %q{Rat Hole is a handy library for creating a rack compliant http proxy that allows you to modify the request from the user and the response from the server.}
  s.email = %q{mikehale@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "CHANGELOG.rdoc",
     "Manifest.txt",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "lib/rat_hole.rb",
     "lib/rat_hole_test.rb",
     "lib/util.rb",
     "rat-hole.gemspec",
     "test/mock_request.rb",
     "test/test_rat_hole.rb"
  ]
  s.homepage = %q{http://github.com/mikehale/rat-hole}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Rack compliant http proxy}
  s.test_files = [
    "test/mock_request.rb",
     "test/test_rat_hole.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, ["< 1.0"])
    else
      s.add_dependency(%q<rack>, ["< 1.0"])
    end
  else
    s.add_dependency(%q<rack>, ["< 1.0"])
  end
end

