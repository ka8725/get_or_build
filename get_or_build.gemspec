# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "get_or_build/version"

Gem::Specification.new do |s|
  s.name        = "get_or_build"
  s.version     = FieldsForBuilder::VERSION
  s.authors     = ["Andrey Koleshko"]
  s.email       = ["ka8725@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Provides method which allows get or build belongs_to or has_one association}
  s.description = %q{Assume user belongs_to company and you want to get company object within one method call. You can do it like this: user.company_or_build}

  s.rubyforge_project = "get_or_build"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "activerecord"
  s.add_development_dependency "actionpack"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rake"
  # s.add_runtime_dependency "rest-client"
end
