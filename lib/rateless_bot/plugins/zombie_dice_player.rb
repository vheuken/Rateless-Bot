require 'cinch'
require 'zombie_dice'

class ZombieDicePlayer
  def help
    '!zd start - starts a game of Zombie Dice'
  end

  include ZombieDice
  include Cinch::Plugin

  match /zd /

  def execute(m)
    command = m.message.split('!zd ')[1]

    begin
      send(command + '_command', m)
    rescue NoMethodError
      m.reply "Unknown command: \"#{m.message}\""
    end
  end

  def start_command(m)
    m.reply 'Starting a game of Zombie Dice! Type "!zd join" to join!'
  end

  def join_command(m)
    m.reply "#{m.user.nick} has joined the game!"
  end
end
