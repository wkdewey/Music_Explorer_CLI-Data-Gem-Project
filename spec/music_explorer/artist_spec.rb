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
  context "when looking up an artist" do
    artist_query = "Bob Dylan"
    artist_data = MusicExplorer::Artist.lookup_artist(artist_query)
    it "returns artist data in a hash" do
      expect(artist_data).not_to be nil
      expect(artist_data).to be_a(Hash)
    end
    it "returns the correct artist" do
      expect(artist_data[:name]).to eq("Bob Dylan")
    end

  end

end