require 'pry'
require_relative './lib/connection'
require_relative './lib/song'
require_relative './lib/album'
require_relative './lib/artist'

above = Artist.create({
  name: "Above & Beyond"
})

bayer = Artist.create({
  name: "Andrew Bayer"
})

mat = Artist.create({
  name: "Ilan Bluestone"
})

acoustic = Album.create({
  name: "Acoustic",
  artist_id: above.id
})

never = Album.create({
  name: "If It Were You, We'd Never Leave",
  artist_id: bayer.id
})

control = Album.create({
  name: "Damage Control",
  artist_id: mat.id
})

Song.create({
  title: "Sirens of the Sea"
  album_id: acoustic.id
})

Song.create({
  title: "It's Going To Be Fine"
  album_id: never.id
})

Song.create({
  title: "The Sky"
  album_id: control.id
})
