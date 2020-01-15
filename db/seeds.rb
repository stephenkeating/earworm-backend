require 'rest-client'
require 'base64'


# Spotify API details:
  # I'm using Spotify's Client Credentials Flow for auth. Documentation here:
    # https://developer.spotify.com/documentation/general/guides/authorization-guide/#client-credentials-flow
  # Base URL: https://api.spotify.com/v1

  spotify_api_client_id = ENV['spotify_api_client_id']
  spotify_api_key = ENV['spotify_api_key']

  client_token = Base64.strict_encode64(spotify_api_client_id + ':' + spotify_api_key)
  spotify_token = RestClient.post("https://accounts.spotify.com/api/token",{"grant_type": "client_credentials"}, {"Authorization": "Basic #{client_token}"})
  parsed_token = JSON.parse(spotify_token)

  # Spotify -- Get a Playlist's Tracks (only returns first 100 tracks)
    # GET  /v1/playlists/{playlist_id}/tracks	
    # URI to get tracks 100-199 (kanye example):
      # "https://api.spotify.com/v1/playlists/7nTVBKlpid6ifbk0q3AWOP/tracks?offset=100"

      # Some Artist IDs (for reference)
        # Kanye artist id: spotify:artist:5K4W6rqBFWDnAN6FQUkS6x
      
    # Spotify Playlists to Add:
      # Kanye West's Complete Collection : spotify:playlist:7nTVBKlpid6ifbk0q3AWOP
        kanye_playlist_url_1 = 'https://api.spotify.com/v1/playlists/7nTVBKlpid6ifbk0q3AWOP'
        kanye_playlist_url_2 = 'https://api.spotify.com/v1/playlists/7nTVBKlpid6ifbk0q3AWOP/tracks?offset=100'
      # Rolling Stone Top 500 Songs
      # Spotify Top Tracks?
      # This Is Spice Girls 
        spice_girls_url = 'https://api.spotify.com/v1/playlists/37i9dQZF1DWWUJdr9ahsbf'
      # 80s Smash Hits spotify:playlist:19PgP2QSGPcm6Ve8VhbtpG
        eighties_smash_hits_url = 'https://api.spotify.com/v1/playlists/19PgP2QSGPcm6Ve8VhbtpG'
      # 90s Smash Hits spotify:playlist:3C64V048fGyQfCjmu9TIGA
        nineties_smash_hits_url_1 = 'https://api.spotify.com/v1/playlists/3C64V048fGyQfCjmu9TIGA'
        nineties_smash_hits_url_2 = 'https://api.spotify.com/v1/playlists/3C64V048fGyQfCjmu9TIGA/tracks?offset=100'
      # 2000s Smash Hits spotify:playlist:2f6tXtN0XesjONxicAzMIw
        two_thousands_smash_hits_url = 'https://api.spotify.com/v1/playlists/2f6tXtN0XesjONxicAzMIw'
      # This Is Ariana Grande spotify:playlist:37i9dQZF1DX1PfYnYcpw8w
        araiana_grande_url = 'https://api.spotify.com/v1/playlists/37i9dQZF1DX1PfYnYcpw8w' 
      # This Is The Beatles spotify:playlist:37i9dQZF1DXdLtD0qszB1w
        the_beatles_url = 'https://api.spotify.com/v1/playlists/37i9dQZF1DXdLtD0qszB1w' 
      # This Is Elton John spotify:playlist:37i9dQZF1DX7VulteLVOkq
        elton_john_url = 'https://api.spotify.com/v1/playlists/37i9dQZF1DX7VulteLVOkq' 

  
    kanye_playlist_object_1 = `curl -X GET #{kanye_playlist_url_1} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_kanye_playlist_1 = JSON.parse(kanye_playlist_object_1)
    # parsed_kanye_playlist_1.keys ==> ["collaborative", "description", "external_urls", "followers", "href", "id", "images", "name", "owner", "primary_color", "public", "snapshot_id", "tracks", "type", "uri"]

    kanye_playlist_object_2 = `curl -X GET #{kanye_playlist_url_2} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_kanye_playlist_2 = JSON.parse(kanye_playlist_object_2)

    spice_girls_object = `curl -X GET #{spice_girls_url} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_spice_girls_playlist = JSON.parse(spice_girls_object)

    eighties_smash_hits_object = `curl -X GET #{eighties_smash_hits_url} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_eighties_smash_hits_playlist = JSON.parse(eighties_smash_hits_object)

    nineties_smash_hits_object_1 = `curl -X GET #{nineties_smash_hits_url_1} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_nineties_smash_hits_playlist_1 = JSON.parse(nineties_smash_hits_object_1)

    nineties_smash_hits_object_2 = `curl -X GET #{nineties_smash_hits_url_2} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_nineties_smash_hits_playlist_2 = JSON.parse(nineties_smash_hits_object_2)

    two_thousands_smash_hits_object = `curl -X GET #{two_thousands_smash_hits_url} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_two_thousands_smash_hits_playlist = JSON.parse(two_thousands_smash_hits_object)
    
    araiana_grande_object = `curl -X GET #{araiana_grande_url} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_araiana_grande_playlist = JSON.parse(araiana_grande_object)
    
    the_beatles_object = `curl -X GET #{the_beatles_url} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_the_beatles_playlist = JSON.parse(the_beatles_object)
    
    elton_john_object = `curl -X GET #{elton_john_url} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_elton_john_playlist = JSON.parse(elton_john_object)


    # byebug

  # map over the individual tracks by calling: parsed_kanye_playlist_1['tracks']['items']
    kanye_playlist_tracks_1 = parsed_kanye_playlist_1['tracks']['items']
    kanye_playlist_tracks_2 = parsed_kanye_playlist_2['items']

    spice_girls_tracks = parsed_spice_girls_playlist['tracks']['items']
    
    eighties_smash_hits_tracks = parsed_eighties_smash_hits_playlist['tracks']['items']
    
    nineties_smash_hits_tracks_1 = parsed_nineties_smash_hits_playlist_1['tracks']['items']
    nineties_smash_hits_tracks_2 = parsed_nineties_smash_hits_playlist_2['items']

    two_thousands_smash_hits_tracks = parsed_two_thousands_smash_hits_playlist['tracks']['items']

    araiana_grande_tracks = parsed_araiana_grande_playlist['tracks']['items']

    the_beatles_tracks = parsed_the_beatles_playlist['tracks']['items']
    
    elton_john_tracks = parsed_elton_john_playlist['tracks']['items']
    
    # kanye_playlist_tracks_1[0].keys ==> ["added_at", "added_by", "is_local", "primary_color", "track", "video_thumbnail"]
    # while looping over tracks, will have to call track["track"] to get down to data
    # kanye_playlist_tracks_1[0]['track'].keys == > ["album", "artists", "available_markets", "disc_number", "duration_ms", "episode", "explicit", "external_ids", "external_urls", "href", "id", "is_local", "name", "popularity", "preview_url", "track", "track_number", "type", "uri"]

    # byebug

  # Clear the playlists for re-seeding
    Playlist.destroy_all

  # Create Playlist Objects
    # first one has more info than I need:
      # @kanye_playlist = Playlist.create(displayName: "Kanye's Complete Collection", spotifyName: parsed_kanye_playlist_1["name"], spotifyDescription: parsed_kanye_playlist_1["description"], spotifyId: parsed_kanye_playlist_1["id"], spotifyUri: parsed_kanye_playlist_1["uri"])
    @kanye_playlist = Playlist.create(displayName: "Kanye's Complete Collection", spotifyName: parsed_kanye_playlist_1["name"], spotifyDescription: parsed_kanye_playlist_1["description"], spotifyId: parsed_kanye_playlist_1["id"], spotifyUri: parsed_kanye_playlist_1["uri"])
    @spice_girls_playlist = Playlist.create(displayName: "This is Spice Girls", spotifyName: parsed_spice_girls_playlist["name"], spotifyDescription: parsed_spice_girls_playlist["description"], spotifyId: parsed_spice_girls_playlist["id"], spotifyUri: parsed_spice_girls_playlist["uri"])
    @eighties_smash_hits_playlist = Playlist.create(displayName: "80s Smash Hits", spotifyName: parsed_eighties_smash_hits_playlist["name"], spotifyDescription: parsed_eighties_smash_hits_playlist["description"], spotifyId: parsed_eighties_smash_hits_playlist["id"], spotifyUri: parsed_eighties_smash_hits_playlist["uri"])
    @nineties_smash_hits_playlist = Playlist.create(displayName: "90s Smash Hits", spotifyName: parsed_nineties_smash_hits_playlist_1["name"], spotifyDescription: parsed_two_thousands_smash_hits_playlist["description"], spotifyId: parsed_two_thousands_smash_hits_playlist["id"], spotifyUri: parsed_two_thousands_smash_hits_playlist["uri"])
    @two_thousands_smash_hits_playlist = Playlist.create(displayName: "2000s Smash Hits", spotifyName: parsed_two_thousands_smash_hits_playlist["name"], spotifyDescription: parsed_two_thousands_smash_hits_playlist["description"], spotifyId: parsed_two_thousands_smash_hits_playlist["id"], spotifyUri: parsed_two_thousands_smash_hits_playlist["uri"])
    @ariana_grande_playlist = Playlist.create(displayName: "This is Ariana Grande", spotifyName: parsed_araiana_grande_playlist["name"], spotifyDescription: parsed_araiana_grande_playlist["description"], spotifyId: parsed_araiana_grande_playlist["id"], spotifyUri: parsed_araiana_grande_playlist["uri"])
    @the_beatles_playlist = Playlist.create(displayName: "This is The Beatles", spotifyName: parsed_the_beatles_playlist["name"], spotifyDescription: parsed_the_beatles_playlist["description"], spotifyId: parsed_the_beatles_playlist["id"], spotifyUri: parsed_the_beatles_playlist["uri"])
    @elton_john_playlist = Playlist.create(displayName: "This is Elton John", spotifyName: parsed_elton_john_playlist["name"], spotifyDescription: parsed_elton_john_playlist["description"], spotifyId: parsed_elton_john_playlist["id"], spotifyUri: parsed_elton_john_playlist["uri"])

  # Create tracks by mapping over parsed playlist objects
  # later, I could try to figure out how to get all artists for the spotifyArtists column
  # preview URLs are not coming in. i think it has to do with the client credentials auth
    # this one has more info than needed, but just in case I need the syntax later:
      # kanye_playlist_tracks_1.map do |track|
      #   Track.create(playlist: @kanye_playlist, spotifyAlbum: track["track"]["album"], spotifyArtists: track['track']['artists'], spotifyDurationMs: track['track']['duration_ms'], spotifyHref: track['track']['href'], spotifyId: track['track']['id'], spotifyName: track['track']['name'], spotifyPopularity: track['track']['popularity'], spotifyPreviewUrl: track['track']['preview_url'], spotifyUri: track['track']['uri'])
      # end 
    kanye_playlist_tracks_1.map do |track|
      Track.create(playlist: @kanye_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end 
    kanye_playlist_tracks_2.map do |track|
      Track.create(playlist: @kanye_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end 
    spice_girls_tracks.map do |track|
      Track.create(playlist: @spice_girls_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end
    eighties_smash_hits_tracks.map do |track|
      Track.create(playlist: @eighties_smash_hits_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end
    nineties_smash_hits_tracks_1.map do |track|
      Track.create(playlist: @nineties_smash_hits_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end 
    nineties_smash_hits_tracks_2.map do |track|
      Track.create(playlist: @nineties_smash_hits_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end 
    two_thousands_smash_hits_tracks.map do |track|
      Track.create(playlist: @two_thousands_smash_hits_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end 
    araiana_grande_tracks.map do |track|
      Track.create(playlist: @ariana_grande_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end 
    the_beatles_tracks.map do |track|
      Track.create(playlist: @the_beatles_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end 
    elton_john_tracks.map do |track|
      Track.create(playlist: @elton_john_playlist, spotifyArtists: track['track']['artists'][0]['name'], spotifyName: track['track']['name'], spotifyId: track['track']['id'])
    end 
