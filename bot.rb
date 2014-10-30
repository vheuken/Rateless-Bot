require 'cinch'
require_relative 'plugins/coinflipper'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "Rateless-Bot"
    c.server = "irc.rizon.net"
    c.channels = ["#rateless"]

    c.plugins.plugins = [CoinFlipper]
  end
end

bot.start
