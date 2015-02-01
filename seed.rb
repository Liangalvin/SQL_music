require 'pry'
require_relative './lib/connection'
require_relative './lib/albums'
require_relative './lib/artists'
require_relative './lib/songs'

jcole = Artists.create({
  name: "J Cole",
  });

cole_world = Albums.create({
  name: "Cole World: The Sideline Story",
  artist_id: jcole.id
  });

born_sin = Albums.create({
  name: "Born Sinner",
  artist_id: jcole.id
  });

forest_hill = Albums.create({
  name: "2014 Forest Hills Drive",
  artist_id: jcole.id
  });

Songs.create({
  name: "Work Out",
  album_id: cole_world.id
  });

Songs.create({
  name: "Nobody's Perfect",
  album_id: cole_world.id
  });

Songs.create({
  name: "She Knows",
  album_id: born_sin.id
  });

Songs.create({
  name: "Power Trip",
  album_id: born_sin.id
  })

Songs.create({
  name: "Trouble",
  album_id: born_sin.id
  });

Songs.create({
  name: "No Role Modelz",
  album_id: forest_hill.id
  });

Songs.create({
  name: "Apparently",
  album_id: forest_hill.id
  });
