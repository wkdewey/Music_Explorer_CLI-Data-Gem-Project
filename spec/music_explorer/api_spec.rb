require "rspec"
require "spec_helper"

describe "MusicExplore::API" do
  api = MusicExplorer::API.new("Beyonce")
  context "when initialized with an artist query" do
    it "stores the artist" do
      expect(api.artist).to eq "Beyonce"
    end
  end

end