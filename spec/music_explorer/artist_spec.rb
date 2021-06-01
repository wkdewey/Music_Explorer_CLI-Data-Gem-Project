require "rspec"
require "spec_helper"
require "./lib/music_explorer"

RSpec.describe "MusicExplorer::Artist" do
  artist_data = {name: "Beyonce", genres: [], top_tracks: [], albums: [], related_artists: []}
  artist = MusicExplorer::Artist.new(artist_data)
  context "when initialized with artist data" do
    it "has a name" do
      expect(artist.name).to eq "Beyonce"
    end

    it "has genres" do
      expect(artist.genres).not_to be nil
    end

    it "has top_tracks" do
      expect(artist.top_tracks).not_to be nil
    end

    it "has albums" do
      expect(artist.albums).not_to be nil
    end

    it "has related artists" do
      expect(artist.related_artists).not_to be nil
    end

    it "is included in all artists" do
      expect(MusicExplorer::Artist.all).to include artist
    end
  end
  context "when creating an artist" do
    artist_query = "Bob Dylan"
    MusicExplorer::Artist.create_artist(artist_query)
    it "creates a new artist" do
      expect(MusicExplorer::Artist.all.find { |artist| artist.name == "Bob Dylan" }).not_to be nil
    end
  end

end