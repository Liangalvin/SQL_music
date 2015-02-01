require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/albums'
require_relative './lib/artists'
require_relative './lib/songs'

after do
  ActiveRecord::Base.connection.close
end


######################## HOMEPAGE ONLY
#get the homepage
get("/") do

  erb :index
end


################### Get the artists and allow to add artists
#get all artists
get("/artists") do

  erb :"artists/index", { locals: { artists: Artists.all() } }
end

#ability to add to artists
post('/artists') do
  artist = {
    name: params[:name]
  }

  Artists.create(artist)

  erb(:"artists/index", locals: {artists: Artists.all()})
end


##################### Albums for the artists and add albums
#send the albums to the show.erb for the artist
get("/artists/:id") do
  artist = Artists.find_by({id: params[:id].to_i})

  erb :"artists/show", locals: { artist: artist }
end

#add albums to the artist
post("/albums") do
  album = {
    name: params[:name],
    artist_id: params[:artist_id].to_i
  }

  Albums.create(album)
  artist = Artists.find_by({id: params[:artist_id].to_i})

  erb :"artists/show", locals: {artist: artist}
end


####################### Select an album and add songs
#select the album of the selected album id
get("/albums/:id") do
  album = Albums.find_by({id: params[:id]})
  #puts album

  erb :"albums/index", locals: {album: album}
end

#add song to the album
post("/song") do
  song = {
    name: params[:name],
    album_id: params[:album_id]
  }

  Songs.create(song)
  album = Albums.find_by({id: params[:album_id]})
  #puts album

  erb :"albums/index", locals: {album: album}
end


####################### Complete destroy section, delete artists/albums/songs
#delete song
delete("/song/:id") do
  song = Songs.find_by({id: params[:id].to_i})

  song.destroy

  redirect "/artists"
end

#delete album
delete("/album/:id")do
  album = Albums.find_by({id: params[:id].to_i})

  album.destroy

  redirect "/"
end

#delete artist
delete("/artist/:id")do
  artist = Artists.find_by({id: params[:id].to_i})

  artist.destroy

  redirect"/"
end


######################### Edit songs
#edit song
put("/edit/:id") do

end
