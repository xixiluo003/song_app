require 'json'
require 'net/http'

module Itunes

  BASE_SEARCH_URL = "https://itunes.apple.com/search?"

  def self.get_data(search_term)
    # puts "\n******* get_song_data *******"
    uri = URI(BASE_SEARCH_URL + search_term)
    # puts "** uri: #{uri}"
    Net::HTTP.get(uri)
  end

end
