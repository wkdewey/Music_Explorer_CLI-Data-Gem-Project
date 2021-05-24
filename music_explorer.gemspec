lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'music_explorer/version.rb'

Gem::Specification.new do |spec|
  spec.name          = "music_explorer"
  spec.version       = MusicExplorer::VERSION
  spec.authors       = ["William Dewey"]
  spec.email         = ["wkdewey@gmail.com"]

  spec.summary       = %q{This gem uses the Spotify API to explore music artists.}
  spec.description   = %q{This gem enables users to learn more about music artists with data from the Spotify API. Users are prompted to search for an artist. The app returns the first search result from Spotify and allows users to see the artist's top tracks, album releases, genres or related artists. For the latter option, users can choose one of the related artists and view artist details for that artist in turn. Finally, users can review a list of all artists they have browsed. The app makes use of the RSpotify gem for OAuth authentication, HTTParty to retrieve data from the API, and dotenv to store client_id and client_secret. As explained below under Usage, this means that users will need to obtain their own credentials from Spotify and store them in their own .env file. More info at https://github.com/wkdewey/Music_Explorer_CLI-Data-Gem-Project}
  spec.homepage      = "https://github.com/wkdewey/Music_Explorer_CLI-Data-Gem-Project"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

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
  spec.add_dependency "httparty", "~> 0.18"
  spec.add_dependency "dotenv", "~> 2.7.5"
  spec.add_dependency "rspotify", "~> 2.8.0"
end
