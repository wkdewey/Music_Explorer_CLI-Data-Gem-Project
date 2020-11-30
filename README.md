# Music_Explorer

This gem enables users to learn more about music artists with data from the Spotify API. Users are prompted to search for an artist. The app returns the first search result from Spotify and allows users to see the artist's top tracks, album releases, genres or related artists. For the latter option, users can choose one of the related artists and view artist details for that artist in turn. Finally, users can review a list of all artists they have browsed. The app makes use of the RSpotify gem for OAuth authentication, HTTParty to retrieve data from the API, and dotenv to store client_id and client_secret. As explained below under Usage, this means that users will need to obtain their own credentials and store them in their own .env file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'musicexplorer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install musicexplorer

## Usage

You must obtain a client_id and client_secret from https://developer.spotify.com/dashboard and put them in your .env file. Then follow the instructions on the screen to search the API and choose the options described above. The app will store all artists you search for, and they can be retrieved from the main menu.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wkdewey/Music_Explorer_CLI-Data-Gem-Project. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/wkdewey/Music_Explorer_CLI-Data-Gem-Project/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Music_Explorer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/wkdewey/Music_Explorer_CLI-Data-Gem-Project/blob/master/CODE_OF_CONDUCT.md).
