class MusicExplorer::Artist

  attr_accessor :name, :top_tracks, :albums, :related_artists

  @@all = []
  
  def self.lookup_and_create_artist(artist_query)
    artist_data = lookup_artist(artist_query)
    self.new(artist_data)
  end

  def self.lookup_artist(artist_query)
    #Calls the API with the user's query, in order to get a hash of artist data
    artist_data = {}
    api = MusicExplorer::API.new(artist_query)
    artist_data = api.retrieve_artist_data
    # artist_data[:name] = artist_query
    artist_data
  end

  def self.all
    @@all
  end

  def initialize(artist_data = nil)
    #creates Artist object from the hash returned from the API
    if artist_data && artist_data.length > 0
      @name = artist_data[:name]
      @top_tracks = artist_data[:top_tracks]
      @albums = artist_data[:albums]
      @related_artists = artist_data[:related_artists]
      @@all << self
    end
  end


end