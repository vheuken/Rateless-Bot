require 'cinch'
require 'lastfm'

class LastFM
  def help
    '!lastfm USERNAME - get a given user\'s most recently scrobbled track'
  end

  include Cinch::Plugin

  def initialize(*args)
    super
    @lastfm = Lastfm.new(config[:api_key], config[:api_secret])
  end

  match /lastfm [^\s-]/

  def execute(m)
    user = m.message.split('!lastfm ')[1]
    scrobbles = @lastfm.user.get_recent_tracks(:user => user)
    track = scrobbles[0]


    m.reply make_track_str(track)
  end

  def make_track_str(track)
    artist_and_title = track['artist']['content'] + ' - ' + track['name']

    artist_and_title + (track['nowplaying'] ? ' [Now Playing]' : '')
  end
end
