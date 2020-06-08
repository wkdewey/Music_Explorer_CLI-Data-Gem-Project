class MusicExplorer::API
  attr_accessor :artist_query, :artist_data, :token, :id

  @@base_url = "https://api.spotify.com/v1/"

  def initialize(artist_query)
    #initialize the API with credentials
    RSpotify.authenticate(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])
    #get the token necessary to look up info from API
    @token = RSpotify.client_token
    #store artist that will be looked up from API
    @artist_query = artist_query
    get_artist_id
    #methods for authentication with Spotify and setup will go here
  end

  def get_artist_id
    #conduct the initial search, get the first result, and return the ID (necessary for other API calls)
    url = "#{@@base_url}search?q=#{@artist_query}&type=artist"
    search = retrieve_data_from_url(url)
    first_result = search["artists"]["items"][0]
    @id = first_result["id"]
  end

  def retrieve_artist_data
    #calls other methods (which interact directly with API) to fill out hash of artist data
    self.artist_data = {}
    self.artist_data[:name] = retrieve_name
    self.artist_data[:top_tracks] = retrieve_top_tracks
    self.artist_data[:albums] = retrieve_albums
    self.artist_data[:related_artists] = retrieve_related_artists
    self.artist_data
  end

  def retrieve_data_from_url(url)
    HTTParty.get(url, 
      {headers: {"Authorization" => "Bearer #{@token}"}}
    )
  end

  def return_array_with_names(array)
    name_array = []
    array.collect do |item|
      name_array << item["name"]
    end
    name_array
  end

  def retrieve_name
    #Get name of artist based on search from API
    #search for the artist
    url = "#{@@base_url}artists/#{id}"
    artist = retrieve_data_from_url(url)
    artist["name"]
  end

  def retrieve_top_tracks
    #Get top tracks for artists from API in form of array
    #will return fake data until I implement the API
    url = "#{@@base_url}artists/#{id}/top-tracks?country=US"
    top_tracks = retrieve_data_from_url(url)
    return_array_with_names(top_tracks["tracks"])
  end

  def retrieve_albums
    #Get all of artists's albums from API in form of array
    url = "#{@@base_url}artists/#{id}/albums?country=US"
    albums = retrieve_data_from_url(url)
    return_array_with_names(albums["items"])
  end

  def retrieve_related_artists
    #Get related artists from API in form of array
    url = "#{@@base_url}artists/#{id}/related-artists?country=US"
    related_artists = retrieve_data_from_url(url)
    return_array_with_names(related_artists["artists"])
  end
end