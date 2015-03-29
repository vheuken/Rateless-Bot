require 'cinch'

class DiceRoller
  def help
    '!roll XdY - rolls dice (replace X with number of dice and Y with number of sides)'
  end

  include Cinch::Plugin

  match /roll \d+d\d+/

  def execute(m)
    command = /\d+d\d+/.match(m.message).to_s
    
    num_of_dice = command.split('d')[0].to_i
    num_of_sides = command.split('d')[1].to_i
    
    reply = ''
 
    num_of_dice.times { reply << rand(1..num_of_sides).to_s + ' ' }

    m.reply reply
  end

end
