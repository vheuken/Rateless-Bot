require 'cinch'
require 'yaml'
require_relative 'plugins/coin_flipper'
require_relative 'plugins/dice_roller'
require_relative 'plugins/help'
require_relative 'plugins/magic_eight_ball'
require_relative 'plugins/video_title'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "Rateless-Bot"
    c.server = "irc.rizon.net"
    c.channels = ["#rateless"]

    c.plugins.plugins = [CoinFlipper,
			 DiceRoller,
			 Help,
			 MagicEightBall,
                         VideoTitle]
  end
end

bot.start
