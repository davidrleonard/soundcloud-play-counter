require 'soundcloud'
require 'yaml'

class PlaysGetter
  def initialize
    # Get the Soundcloud API client
    client = Soundcloud.new(
      :client_id => SC_CONFIG['client_id'],
      :client_secret => SC_CONFIG['client_secret'],
      :username => SC_CONFIG['username'],
      :password => SC_CONFIG['password'])
    # Get all tracks, loop over them for a total play count lifetime
    @plays = 0
    tracks = client.get('/me/tracks', :limit => 1000) # arbitrarily limit the number of tracks to 1000... we're in the 120's now
    tracks.each do |track|
      @plays += track['playback_count'].to_i
    end
  end
  def current_play_count
    @plays
  end
end
