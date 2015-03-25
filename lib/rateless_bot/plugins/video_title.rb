require 'uri'
require 'cinch'
require 'video_info'

class VideoTitle
  include Cinch::Plugin

  listen_to :message

  def listen(m)
    if m.message.match(/youtube.com\/watch\?/)
      video_url = get_url(m.message)

      m.reply get_video_title(video_url)
    end
  end

  def get_url(message)
    index = message.index("youtube.com\/watch\?")
    message[index..message.length].split(' ')[0]
  end

  def get_video_title(video_url)
    video = VideoInfo.new(video_url)
    video.title
  end
end
