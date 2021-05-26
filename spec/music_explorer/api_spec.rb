require "rspec"
require "spec_helper"
require "./lib/music_explorer"

RSpec.describe "MusicExplore::API" do
  api = MusicExplorer::API.new("Beyonce")
  context "when initialized with an artist query" do
    it "stores the artist" do
      expect(api.artist_query).to eq "Beyonce"
    end

    it "receives a client token for the API" do
      expect(api.token).not_to be nil
    end
  end

end