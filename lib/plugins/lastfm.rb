require 'cinch'
require 'lastfm'

class LastFM
  include Cinch::Plugin

  def initialize(*args)
    super
    @lastfm = Lastfm.new("FOO", "BAR")
  end

  match "lastfm"

  def execute(m)
    scrobbles = @lastfm.user.get_recent_tracks(:user => 'dormothenord')
    track = scrobbles[0]
    

    m.reply make_track_str(track)
  end

  def make_track_str(track)
    artist_and_title = track['artist']['content'] + ' - ' + track['name']

    artist_and_title + (track['nowplaying'] ? ' [Now Playing]' : '')
  end
end
