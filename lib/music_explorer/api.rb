class MusicExplorer::API
  attr_accessor :artist_query, :artist_data, :token, :id

  @@base_url = "https://api.spotify.com/v1/"

  def initialize(artist_query)
    #initialize the API with credentials
    RSpotify.authenticate(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    @token = RSpotify.client_token
    #store artist that will be looked up from API
    @artist_query = artist_query
    get_artist_id
    #methods for authentication with Spotify and setup will go here
  end

  def get_artist_id
    #conduct the initial search, get the first result, and return the ID (necessary for other API calls)
    url = "#{@@base_url}search?q=#{@artist_query}&type=artist"
    search = HTTParty.get(url, 
      {headers: {"Authorization" => "Bearer #{@token}"}}
    )
    first_result = search["artists"]["items"][0]
    @id = first_result["id"]
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
    #search for the artist
    url = "#{@@base_url}artists/#{id}"
    artist = HTTParty.get(url, 
      {headers: {"Authorization" => "Bearer #{@token}"}}
    )
    artist["name"]
  end

  def retrieve_top_tracks
    #Get top tracks for artists from API in form of array
    #will return fake data until I implement the API
    url = "#{@@base_url}artists/#{id}/top-tracks?country=US"
    top_tracks = HTTParty.get(url, 
      {headers: {"Authorization" => "Bearer #{@token}"}}
    )
    top_tracks_array = []
    top_tracks["tracks"].each do |track|
      top_tracks_array << track["name"]
    end
    top_tracks_array
  end

  def retrieve_albums
    #Get all of artists's albums from API in form of array
    url = "#{@@base_url}artists/#{id}/albums?country=US"
    albums = HTTParty.get(url, 
      {headers: {"Authorization" => "Bearer #{@token}"}}
    )
    albums_array = []
    albums["items"].each do |album|
      albums_array << album["name"]
    end
    albums_array
  end

  def retrieve_related_artists
    #Get related artists from API in form of array
    url = "#{@@base_url}artists/#{id}/related-artists?country=US"
    related_artists = HTTParty.get(url, 
      {headers: {"Authorization" => "Bearer #{@token}"}}
    )
    related_artists_array = []
    related_artists["artists"].each do |artist|
      related_artists_array << artist["name"]
    end
    related_artists_array
    binding.pry
  end
end