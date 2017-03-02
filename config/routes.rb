Rails.application.routes.draw do

  get "/" => "songs#home"
  get "/searchsong" => "songs#get_song"
  # get "/page_test" => "songs#test"
  get "/searchmovie" => "songs#get_movie"
end
