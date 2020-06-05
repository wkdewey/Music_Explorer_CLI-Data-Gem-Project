class MusicExplorer::CLI

  attr_accessor :user_choice
  
  def call
    puts "Welcome to the Music Explorer!"
    program_options
  end

  def program_options
    while true
      puts "Please select an option (1-3)"
      puts "1. Search for an artist"
      puts "2. Get more info about current artist"
      puts "3. Leave program"
      user_choice = get_user_input.to_i
      case user_choice
      when 1
        search_artists
      when 2
        artist_options
      when 3
        end_program
      end
    end
  end

  def search_artists
    puts "What artist would you like more info about?"
    artist = self.get_user_input
    display_artist(artist)
  end

  def display_artist(artist)
    puts "You have chosen #{artist}"
    artist_options(artist)
  end

  def artist_options(artist)
    puts "Please select an option (1-3)"
    puts "1. Display #{artist}'s top tracks"
    puts "2. Display #{artist}'s albums"
    puts "3. Display artists related to #{artist}"
    puts "4. Go back to main menu"
    user_choice = get_user_input.to_i
      case user_choice
      when 1
        display_top_tracks
      when 2
        display_albums
      when 3
        display_related_artists
      when 4
        program_options
      end
  end

  def display_top_tracks
  end

  def display_albums
  end

  def display_related_artists
  end

  def get_user_input
    gets.strip
  end

  def end_program
    puts "Goodbye!"
    exit
  end


end