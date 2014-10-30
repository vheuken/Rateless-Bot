require 'cinch'

class DeadScreamer
  include Cinch::Plugin
  
  timer 18000, method: :timed
  def timed
    if rand(4) == 0
      bot.channels.each { |c| c.send "Dead!" + "!" * rand(10) }
    end
  end
end
