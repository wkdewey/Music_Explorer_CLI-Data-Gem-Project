class MusicExplorer::CLI

  
  def call
    #Welcome message, initially called by the executable program
    puts "Welcome to the Music Explorer!"
    program_options
  end

  def program_options
    while true
      puts
      puts "Please select an option (1-3)"
      puts "1. Search for an artist"
      puts "2. View all artists you have explored"
      puts "3. Leave program"
      puts
      user_choice = get_numeric_input
      case user_choice
      when 1
        search_artists
      when 2
        view_all_artists
      when 3
        end_program
      end
    end
  end

  def search_artists(artist_query = nil)
    if artist_query == nil
      puts
      puts "What artist would you like more info about?"
      puts
      artist_query = self.get_user_input
    end
    artist = MusicExplorer::Artist.lookup_and_create_artist(artist_query)
    display_artist(artist)
    artist_options(artist)
  end

  def display_artist(artist)
    puts
    puts "Your search matched #{artist.name}"
    puts
  end

  def artist_options(artist)
    while true
      puts
      puts "Please select an option (1-4)"
      puts "1. Display #{artist.name}'s top tracks"
      puts "2. Display #{artist.name}'s genres"
      puts "3. Display albums by #{artist.name}"
      puts "4. Display artists related to #{artist.name}"
      puts "5. Go back to main menu"
      puts
      case get_numeric_input
        when 1
          display_top_tracks(artist)
        when 2
          display_genres(artist)
        when 3
          display_albums(artist)
        when 4
          display_related_artists(artist)
        when 5
          program_options
      end
    end
  end

  def display_top_tracks(artist)
    if artist.top_tracks
      puts
      puts "#{artist.name}'s top 10 tracks on Spotify are:"
      print_numbered_list(artist.top_tracks)
    puts
    else
      puts
      puts "Top tracks not available for #{artist.name}"
    end
  end

  def display_genres(artist)
    if artist.genres
      puts
      puts "Spotify classifies #{artist.name} as having the following genres:"
      print_numbered_list(artist.genres)
    puts
    else
      puts
      puts "Genres not available for #{artist.name}"
    end
  end

  def display_albums(artist)
    if artist.albums
      puts
      puts "#{artist.name}'s releases include the following albums (up to 20):"
      print_numbered_list(artist.albums.uniq)
      puts
    else
      puts
      puts "Albums not available for #{artist.name}"
      puts
    end
  end

  def display_related_artists(artist)
    if artist.related_artists
      puts
      puts "Here is a list of artists related to #{artist.name}:"
      print_numbered_list(artist.related_artists)
      puts "Would you like to learn more about these artists? (Y/N)"
      user_choice = get_user_input.capitalize
      if user_choice[0] == "Y"
        explore_related_artists(artist.related_artists)
      end
    else
      puts
      puts "Related artists not available for #{artist.name}"
      puts
    end
  end

  def explore_related_artists(related_artists)
    puts
    puts "Choose one of the above artists by number"
    user_input = get_numeric_input
    if user_input >=1 && user_input <= 20
      puts
      search_artists(related_artists[user_input - 1])
    else
      puts "Number out of range (1-20)"
      explore_related_artists(related_artists)
    end
  end

  def view_all_artists
    puts
    puts "Artists explored in this session:"
    MusicExplorer::Artist.all.sort_by {|artist| artist.name}.each_with_index do |artist, index|
      puts "#{artist.name}"
    end
    puts
  end

  def get_user_input
    gets.strip
  end

  def get_numeric_input
    get_user_input.to_i
  end

  def print_numbered_list(array)
    array.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end
  end

  def end_program
    puts "Goodbye!"
    exit
  end


end