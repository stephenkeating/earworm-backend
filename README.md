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
  spotifyArtists:string    <!-- e.g. will have to map in here, but Spotify artist id: parsed_kanye_playlist['tracks']['items'][0]['track']['artists'][0]['id'] -->
  spotifyDurationMs:integer
  spotifyHref:string   <!-- (A link to the Web API endpoint providing full details of the track.) -->
  spotifyId:string   <!-- (The Spotify ID for the track.) -->
  spotifyName:string
  spotifyPopularity:integer
  spotifyPreviewUrl:string
  spotifyUri:string
  playlist:references


Ruby methods to keep in mind if I need to convert an object to a string and back:
album.to_s makes a string
eval(album.to_us) turns it back into an object


