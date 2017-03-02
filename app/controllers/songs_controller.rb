class SongsController < ActionController::Base

  include Itunes

  def home
    puts "\n******* home *******"
  end

  def test
    puts "\n******* test *******"
  end

  def get_song
    puts "\n******* get_song *******"
    # puts "song_params: #{params[:search].inspect}"
    search_term = "term=" + params[:search] + "&entity=song"

    song_data_parse = JSON.parse(Itunes.get_data(search_term))
    @song_array = song_data_parse["results"]
    # puts "@song_array: #{@song_array}"

    @albums = []
    @song_array.each do |song|
      @albums << {
        collectionId: song["collectionId"],
        collectionName: song["collectionName"],
        artistName: song["artistName"],
        artworkUrl100: song["artworkUrl100"],
        primaryGenreName: song["primaryGenreName"],
        releaseDate: song["releaseDate"],
        songs: []
      }
    end

    @album_array = @albums.uniq
    # puts "@album_array: #{@album_array}"

    @album_array.each do |album|
      nextAlbumId = album[:collectionId]
      @song_array.each do |song|
        if song["collectionId"] == nextAlbumId
          album[:songs] << song
        end
      end
    end

    render :template => "songs/song_result"
  end

  def get_movie
    puts "\n******* get_movie *******"

    search_term = "term=" + params[:search] + "&entity=movie"

    movie_data_parse = JSON.parse(Itunes.get_data(search_term))
    @movie_array = movie_data_parse["results"]
    # puts "@movie_array: #{@movie_array}"

    render :template => "songs/movie_result"
  end

end
