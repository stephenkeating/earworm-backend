require 'rest-client'
require 'base64'



# Spotify API details:
  # Base URL: https://api.spotify.com/v1
  SPOTIFY_API_CLIENT_ID = ENV['spotify_api_client_id']
  SPOTIFY_API_KEY = ENV['spotify_api_key']
  # SPOTIFY_API_TOKEN = ENV['spotify_api_token']

  client_token = Base64.strict_encode64(SPOTIFY_API_CLIENT_ID + ':' + SPOTIFY_API_KEY)
  spotify_token = RestClient.post("https://accounts.spotify.com/api/token",{"grant_type": "client_credentials"}, {"Authorization": "Basic #{client_token}"})
  parsed_token = JSON.parse(spotify_token)
  
  # kanye_playlist_object = `curl ("https://api.spotify.com/v1/playlists/7nTVBKlpid6ifbk0q3AWOP",{"grant_type": "client_credentials"}, {"Authorization": "Bearer #{parsed_token["access_token"]}"})
  kanye_playlist_object = `curl -X GET "https://api.spotify.com/v1/playlists/7nTVBKlpid6ifbk0q3AWOP" -H "Authorization: Bearer #{parsed_token["access_token"]}"`
  parsed_kanye_playlist = JSON.parse(kanye_playlist_object)


  
  byebug
  
  # byebug
  # sample code from rspotify
    # API_URI       = 'https://api.spotify.com/v1/'.freeze
    # AUTHORIZE_URI = 'https://accounts.spotify.com/authorize'.freeze
    # TOKEN_URI     = 'https://accounts.spotify.com/api/token'.freeze
    # VERBS         = %w[get post put delete].freeze
    # def authenticate
    #   client_id, client_secret = SPOTIFY_API_CLIENT_ID, SPOTIFY_API_KEY
    #   request_body = { grant_type: 'client_credentials' }
    #   response = RestClient.post(TOKEN_URI, request_body, auth_header)
    #   client_token = JSON.parse(response)['access_token']
    # end

  #authorization notes:
    # 

  # Get a Playlist's Tracks
  #   GET	/v1/playlists/{playlist_id}/tracks	


# Spotify Playlists to Add:
  # Kanye West's Complete Collection : spotify:playlist:7nTVBKlpid6ifbk0q3AWOP
  kanye_playlist_url = 'https://api.spotify.com/v1/playlist/7nTVBKlpid6ifbk0q3AWOP'

# Some Artist IDs (for reference)
  # Kanye artist id: spotify:artist:5K4W6rqBFWDnAN6FQUkS6x

# hash.map { |k,v| [k, v.to_sym] }.to_h
# playlist.item.map { |k,v| [k, v.to_sym] }.to_h

# do API call here with a byebug. get the data I need. 

# what all data do i need. then use a byebug to figure out how to map that into a create



