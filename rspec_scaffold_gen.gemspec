$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rspec_scaffold_gen/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rspec_scaffold_gen"
  s.version     = RspecScaffoldGen::VERSION
  s.authors     = ["Ricardo Baumann"]
  s.email       = ["ricardo.luis.baumann@gmail.com"]
  s.homepage    = "http://github.com/ricardobaumann"
  s.summary     = "Rspec controller scaffold generator"
  s.description = "Rspec controller scaffold generator"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  s.add_development_dependency "sqlite3"
end
