class MusicExplorer::API
  attr_accessor :artist_query, :artist_data
  def initialize(artist_query)
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
  end

  def retrieve_top_tracks
    #Get top tracks for artists from API
  end

  def retrieve_albums
    #Get all of artists's albums from API
  end

  def retrieve_related_artists
    #Get related artists from API
  end
end