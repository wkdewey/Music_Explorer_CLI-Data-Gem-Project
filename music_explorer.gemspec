lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'music_explorer/version.rb'

Gem::Specification.new do |spec|
  spec.name          = "music_explorer"
  spec.version       = MusicExplorer::VERSION
  spec.authors       = ["William Dewey"]
  spec.email         = ["wkdewey@gmail.com"]

  spec.summary       = %q{This gem uses the Spotify API to explore music artists.}
  spec.description   = %q{Users can search for an artist and discover their top tracks, albums, and similar artists.}
  spec.homepage      = "https://github.com/wkdewey/Music_Explorer_CLI-Data-Gem-Project"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wkdewey/Music_Explorer_CLI-Data-Gem-Project"
  spec.metadata["changelog_uri"] = "https://github.com/wkdewey/Music_Explorer_CLI-Data-Gem-Project"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.13.1"
  spec.add_dependency "httparty", "~> 0.17.3"
  spec.add_dependency "dotenv", "~> 2.7.5"
  spec.add_dependency "rspotify", "~> 2.8.0"
end
