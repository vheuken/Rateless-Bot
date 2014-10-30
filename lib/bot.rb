require 'cinch'
require_relative 'plugins/coin_flipper'
require_relative 'plugins/dead_screamer'
require_relative 'plugins/greet'
require_relative 'plugins/help'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "Rateless-Bot"
    c.server = "irc.rizon.net"
    c.channels = ["#rateless"]

    c.plugins.plugins = [CoinFlipper,
			 DeadScreamer,
			 Greet,
			 Help]
  end
end

bot.start
