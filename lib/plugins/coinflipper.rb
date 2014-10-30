require 'cinch'

class CoinFlipper
  def help
    "!flipcoin - flips a coin"
  end

  include Cinch::Plugin
  
  match "flipcoin"

  def execute(m)
    m.reply ["Heads!", "Tails!"][rand(2)]
  end 
end
