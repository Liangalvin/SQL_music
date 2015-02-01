require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/albums'
require_relative './lib/artists'
require_relative './lib/songs'

after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index)
end

get("/artists") do
  erb(:"artists/index", { locals: { artists: Artists.all() } })
end

post('/artists') do
  artist = {
    name: params[:name]
  }
  Artists.create(artist)

  erb(:"artists/index", locals: {artists: Artists.all()})
end

get("/artists/:id") do
  artist = Artists.find_by({id: params[:id].to_i})
  #puts artist
  #puts artist.album
  erb(:"artists/show", locals: { artist: artist })
end

post("/albums") do
  album = {
    name: params[:name],
    artist_id: params[:artist_id].to_i
  }

  Albums.create(album)
  artist = Artists.find_by({id: params[:artist_id].to_i})
  erb(:"artists/show", locals: {artist: artist})
end

get ("/albums/:id") do
  album = Albums.find_by({id: params[:id].to_i})
  puts album.song
  #erb(:"albums/index", locals: {album: album})
end
