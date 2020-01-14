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

  
  
    kanye_playlist_object_1 = `curl -X GET #{kanye_playlist_url_1} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_kanye_playlist_1 = JSON.parse(kanye_playlist_object_1)
    # parsed_kanye_playlist_1.keys ==> ["collaborative", "description", "external_urls", "followers", "href", "id", "images", "name", "owner", "primary_color", "public", "snapshot_id", "tracks", "type", "uri"]

    kanye_playlist_object_2 = `curl -X GET #{kanye_playlist_url_2} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_kanye_playlist_2 = JSON.parse(kanye_playlist_object_2)

    spice_girls_object = `curl -X GET #{spice_girls_url} -H "Authorization: Bearer #{parsed_token["access_token"]}"`
    parsed_spice_girls_playlist = JSON.parse(spice_girls_object)

    # byebug

  # map over the individual tracks by calling: parsed_kanye_playlist_1['tracks']['items']
    kanye_playlist_tracks_1 = parsed_kanye_playlist_1['tracks']['items']
    kanye_playlist_tracks_2 = parsed_kanye_playlist_2['items']

    spice_girls_tracks = parsed_spice_girls_playlist['tracks']['items']

    # kanye_playlist_tracks_1[0].keys ==> ["added_at", "added_by", "is_local", "primary_color", "track", "video_thumbnail"]
    # while looping over tracks, will have to call track["track"] to get down to data
    # kanye_playlist_tracks_1[0]['track'].keys == > ["album", "artists", "available_markets", "disc_number", "duration_ms", "episode", "explicit", "external_ids", "external_urls", "href", "id", "is_local", "name", "popularity", "preview_url", "track", "track_number", "type", "uri"]

    # byebug

  # Clear the playlists for re-seeding
    Playlist.destroy_all

  # Create Playlist Objects
    @kanye_playlist = Playlist.create(displayName: "Kanye's Complete Collection", spotifyName: parsed_kanye_playlist_1["name"], spotifyDescription: parsed_kanye_playlist_1["description"], spotifyId: parsed_kanye_playlist_1["id"], spotifyUri: parsed_kanye_playlist_1["uri"])
    @spice_girls_playlist = Playlist.create(displayName: "This is Spice Girls", spotifyName: parsed_spice_girls_playlist["name"], spotifyDescription: parsed_spice_girls_playlist["description"], spotifyId: parsed_spice_girls_playlist["id"], spotifyUri: parsed_spice_girls_playlist["uri"])

    

  # Create tracks by mapping over parsed playlist objects
  # need to figure out how to get all artists for the spotifyArtists column
  # preview URLs are coming in
    kanye_playlist_tracks_1.map do |track|
      Track.create(playlist: @kanye_playlist, spotifyAlbum: track["track"]["album"], spotifyArtists: track['track']['artists'], spotifyDurationMs: track['track']['duration_ms'], spotifyHref: track['track']['href'], spotifyId: track['track']['id'], spotifyName: track['track']['name'], spotifyPopularity: track['track']['popularity'], spotifyPreviewUrl: track['track']['preview_url'], spotifyUri: track['track']['uri'])
    end 
    kanye_playlist_tracks_2.map do |track|
      Track.create(playlist: @kanye_playlist, spotifyAlbum: track["track"]["album"], spotifyArtists: track['track']['artists'], spotifyDurationMs: track['track']['duration_ms'], spotifyHref: track['track']['href'], spotifyId: track['track']['id'], spotifyName: track['track']['name'], spotifyPopularity: track['track']['popularity'], spotifyPreviewUrl: track['track']['preview_url'], spotifyUri: track['track']['uri'])
    end 
    spice_girls_tracks.map do |track|
      Track.create(playlist: @spice_girls_playlist, spotifyAlbum: track["track"]["album"], spotifyArtists: track['track']['artists'], spotifyDurationMs: track['track']['duration_ms'], spotifyHref: track['track']['href'], spotifyId: track['track']['id'], spotifyName: track['track']['name'], spotifyPopularity: track['track']['popularity'], spotifyPreviewUrl: track['track']['preview_url'], spotifyUri: track['track']['uri'])
    end 

  # byebug





  # response = JSON.parse(request)
  # teams = response["data"]
  # teams.map do |team|
  #     Team.create(id: team["id"], abbreviation: team["abbreviation"], city: team["city"], conference: team["conference"], division: team["division"], full_name: team["full_name"], name: team["name"])
  # end 

# hash.map { |k,v| [k, v.to_sym] }.to_h
# playlist.item.map { |k,v| [k, v.to_sym] }.to_h

# do API call here with a byebug. get the data I need. 

# what all data do i need. then use a byebug to figure out how to map that into a create



