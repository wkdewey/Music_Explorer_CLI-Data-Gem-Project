class MusicExplorer::CLI

  attr_accessor :user_choice
  
  def call
    puts "Welcome to the Music Explorer!"
    program_options
  end

  def program_options
    while true
      user_choice = get_user_input.to_i
      puts "1. Search for an artist"
      puts "2. Get more info about current artist"
      puts "3. Leave program"
      case user_choice
      when 1
        search_artists
      when 2
        artist_options
      when 3
        end_program
    end
  end

  def search_artists
    puts "What artist would you like more info about?"
    artist = self.get_user_input
    display_artist(artist)
  end

  def display_artist
  end

  def artist_options
  end

  def display_top_tracks
  end

  def display_albums
  end

  def display_related_artists
  end

  def get_user_input
  end

  def end_program
    puts goodbye
    exit
  end


end