require 'cinch'

class CoinFlipper
  include Cinch::Plugin

  match "flipcoin"

  def execute(m)
    m.reply ["Heads!", "Tails!"][rand(2)]
  end

end
