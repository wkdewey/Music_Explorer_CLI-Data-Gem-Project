require "rspec"
require "spec_helper"
require "./lib/music_explorer"

RSpec.describe "MusicExplore::Artist" do
  artist_data = {name: "Beyonce", genres: [], top_tracks: [], albums: [], related_artists: []}
  artist = MusicExplorer::Artist.new(artist_data)
  context "when initialized with artist data" do
    it "has a name" do
      expect(artist.new).to eq "Beyonce"
    end

    it "has genres" do
    end

    it "has top_tracks" do

    end

    it "has albums" do

    end

    it "has related artists" do

    end

    it "is included in all artists" do
      expect(MusicExplorer::Artist.all).to include artist
    end

  end

end