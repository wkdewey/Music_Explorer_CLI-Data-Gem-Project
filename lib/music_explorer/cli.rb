class MusicExplorer::CLI

  
  def call
    #Welcome message, initially called by the executable program
    puts "Welcome to the Music Explorer!"
    program_options
  end

  def program_options
    while true
      puts "Please select an option (1-3)"
      puts "1. Search for an artist"
      puts "2. View all artists explored in this session"
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
      puts "What artist would you like more info about?"
      puts
      artist_query = self.get_user_input
    end
    artist = MusicExplorer::Artist.lookup_and_create_artist(artist_query)
    display_artist(artist)
  end

  def display_artist(artist)
    puts "Your search matched #{artist.name}"
    puts
    artist_options(artist)
  end

  def artist_options(artist)
    while true
      puts "Please select an option (1-4)"
      puts "1. Display #{artist.name}'s top tracks"
      puts "2. Display albums by #{artist.name}"
      puts "3. Display artists related to #{artist.name}"
      puts "4. Go back to main menu"
      puts
      user_choice = get_numeric_input
      case user_choice
        when 1
          display_top_tracks(artist)
        when 2
          display_albums(artist)
        when 3
          display_related_artists(artist)
        when 4
          program_options
      end
    end
  end

  def display_top_tracks(artist)
    if artist.top_tracks
      puts "#{artist.name}'s top tracks are:"
      print_numbered_list(artist.top_tracks)
    puts
    else
      puts "Top tracks not available for #{artist.name}"
    end
    artist_options(artist)
  end

  def display_albums(artist)
    if artist.albums
      puts "#{artist.name}'s releases include the following albums (up to 20):"
      print_numbered_list(artist.albums.uniq)
      puts
    else
      puts "Albums not available for #{artist.name}"
      puts
    end

    artist_options(artist)
  end

  def display_related_artists(artist)
    if artist.related_artists
      puts "Here is a list of artists similar to #{artist.name}:"
      print_numbered_list(artist.related_artists)
      puts "Would you like to know more about these artists? (Y/N)"
      user_choice = get_user_input.capitalize
      if user_choice[0] == "Y"
        explore_related_artists(artist.related_artists)
      end
    else
      puts "Related artists not available for #{artist.name}"
      puts
    end
    artist_options(artist)
  end

  def explore_related_artists(related_artists)
    puts "Choose one of the above artists by number"
    user_choice = -1
    while user_choice < 1 || user_choice > 20
      user_choice = get_numeric_input - 1
    end
    puts
    search_artists(related_artists[user_choice])
  end

  def view_all_artists
    MusicExplorer::Artist.all.each_with_index do |artist, index|
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