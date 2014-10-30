require 'cinch'

class Greet
  include Cinch::Plugin

  listen_to :join

  def listen(m)
    m.user.notice("Greetings, #{m.user.nick}! Welcome to #rateless!")
    m.user.notice("I am Rateless Bot. If you'd like to see what I can do, type !help")
  end
end
