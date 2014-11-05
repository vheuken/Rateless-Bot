require 'bundler'
Bundler.require
require 'cinch'
require 'yaml'
require_relative 'plugins/coin_flipper'
require_relative 'plugins/dice_roller'
require_relative 'plugins/dead_screamer'
require_relative 'plugins/greet'
require_relative 'plugins/help'
require_relative 'plugins/magic_eight_ball'
require_relative 'plugins/zombie_dice_player'
require_relative 'plugins/video_title'

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "Rateless-Bot"
    c.server = "irc.rizon.net"
    c.channels = ["#rateless"]

    c.plugins.plugins = [CoinFlipper,
			 DeadScreamer,
			 DiceRoller,
			 Greet,
			 Help,
			 MagicEightBall,
                         VideoTitle,
                         ZombieDicePlayer]
  end
end

bot.start
