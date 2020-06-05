class MusicExplorer::CLI

  attr_accessor :user_choice
  
  def call
    puts "Welcome to the Music Explorer!"
    program_options
  end

  def program_options
    while true
      puts "Please select an option (1-2)"
      puts "1. Search for an artist"
      puts "2. Leave program"
      user_choice = get_user_input.to_i
      case user_choice
      when 1
        search_artists
      when 2
        end_program
      end
    end
  end

  def search_artists
    puts "What artist would you like more info about?"
    artist_query = self.get_user_input
    artist = MusicExplorer::Artist.lookup_and_create_artist(artist_query)
    display_artist(artist)
  end

  def display_artist(artist)
    puts "You have chosen #{artist.name}"
    artist_options(artist)
  end

  def artist_options(artist)
    while true
    puts "Please select an option (1-4)"
    puts "1. Display #{artist.name}'s top tracks"
    puts "2. Display #{artist.name}'s albums"
    puts "3. Display artists related to #{artist.name}"
    puts "4. Go back to main menu"
    user_choice = get_user_input.to_i
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
    puts "#{artist.name}'s top tracks are:"
    if artist.top_tracks
      artist.top_tracks.each_with_index do |track, index|
        puts "#{index}. #{track}"
      end
    else
      puts "Top tracks not available for #{artist.name}"
    end
    artist_options(artist)
  end

  def display_albums(artist)
    if artist.albums
      puts "#{artist.name} has released the following albums:"
      artist.albums.each_with_index do |album, index|
        puts "#{index}. #{album}"
      end
    else
      puts "Albums not available for #{artist.name}"
    end

    artist_options(artist)
  end

  def display_related_artists(artist)
    if artist.related_artists
      puts "Here is a list of artists similar to #{artist.name}:"
      artist.related_artists.each_with_index do |related_artist, index|
        puts "#{index}. #{related_artist}"
      end
    else
      puts "Related artists not available for #{artist.name}"
    end
    artist_options(artist)
  end

  def get_user_input
    gets.strip
  end

  def end_program
    puts "Goodbye!"
    exit
  end


end