# README

Notes:

Fields I want from a Spotify playlist:
  displayName:string
  spotifyName:string
  spotifyDescription:string
  spotifyId:string
  spotifyUri:string

Fields I want from a Spotify track:
  spotifyAlbum:string  <!-- e.g. parsed_kanye_playlist['tracks']['items'][0]['track']['album']['id'] -->
  artists:string    <!-- to get just the Spotify artist id: parsed_kanye_playlist['tracks']['items'][0]['track']['artists'][0]['id'] -->
  duration_ms:integer
  href:string   <!-- (A link to the Web API endpoint providing full details of the track.) -->
  id:string   <!-- (The Spotify ID for the track.) -->
  name:string
  popularity:integer
  preview_url:string
  uri:string
  playlist:references

also, give the track a playlist_id foreign key

album.to_s makes a string
eval(album.to_us) turns it back into an object


