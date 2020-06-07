class MusicExplorer::API
  attr_accessor :artist_query, :artist_data
  def initialize(artist_query)
    #initialize the API with credentials
    RSpotify.authenticate(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    token = RSpotify.client_token
    #store artist that will be looked up from API
    @artist_query = artist_query
    #methods for authentication with Spotify and setup will go here
  end

  def retrieve_data
    #calls other methods (which interact directly with API) to fill out hash of artist data
    self.artist_data = {}
    self.artist_data[:name] = retrieve_name
    self.artist_data[:top_tracks] = retrieve_top_tracks
    self.artist_data[:albums] = retrieve_albums
    self.artist_data[:related_artists] = retrieve_related_artists
    self.artist_data
  end

  def retrieve_name
    #Get name of artist based on search from API
    #will just hard code until I implement the API interaction
    @artist_query
  end

  def retrieve_top_tracks
    #Get top tracks for artists from API in form of array
    #will return fake data until I implement the API
    ["Track 1", "Track 2", "Track 3", "Track 4", "Track 5", "Track 6", "Track 7", "Track 8", "Track 9", "Track 10"]
  end

  def retrieve_albums
    #Get all of artists's albums from API in form of array
    ["Album 1", "Album 2", "Album 3", "Album 4", "Album 5"]
  end

  def retrieve_related_artists
    #Get related artists from API in form of array
    ["ABBA", "The Beatles", "Cam'ron", "The Dandy Warhols", "Eazy-E"]
  end
end