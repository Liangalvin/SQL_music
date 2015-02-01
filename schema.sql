CREATE TABLE artists(
  id INTEGER PRIMARY KEY,
  name text
);

CREATE TABLE albums(
  id INTEGER PRIMARY KEY,
  name text,
  artist_id integer references artists
);

CREATE TABLE songs(
  id INTEGER PRIMARY KEY,
  name text,
  album_id integer references albums
);
