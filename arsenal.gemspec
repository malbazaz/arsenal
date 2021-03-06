
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "arsenal/version"

Gem::Specification.new do |spec|
  spec.name          = "arsenal"
  spec.version       = Arsenal::VERSION
  spec.authors       = ["malbazaz"]
  spec.email         = ["39787850+malbazaz@users.noreply.github.com"]

  spec.summary       = "This app presents Arsenal players and provides further information for selected players."
  spec.description   = "The player roster is scrapped from Arsenal's website for uptodate player list."
  spec.homepage      = "https://github.com/malbazaz/arsenal"
  spec.license       = "MIT"



  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'
  


end
