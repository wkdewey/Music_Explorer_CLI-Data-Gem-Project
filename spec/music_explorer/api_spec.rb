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

  context "when retrieving data" do

    artist_data = api.retrieve_artist_data
    it "returns an artist_data object" do
      expect(api.artist_data).not_to be nil
    end

    it "returns an artist_data object with information" do
      expect(api.artist_data[:name]).not_to be nil
      expect(api.artist_data[:name]).to eq "Beyoncé"
      expect(api.artist_data[:genres]).not_to be nil
      expect(api.artist_data[:top_tracks]).not_to be nil
      expect(api.artist_data[:albums]).not_to be nil
    end
  end



end