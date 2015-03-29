require 'cinch'

class MagicEightBall
  def help
    '!8ball - Magic Eight Ball'
  end
  @@answers = ['It is certain',
  	       'It is decidedly so',
	       'Without a doubt',
	       'Yes, definately',
	       'You may rely on it',
	       'As I see it, yes',
	       'Most likely',
	       'Outlook: good',
	       'Yes',
	       'Signs point to yes',
	       'Reply hazy; try again',
	       'Ask again later',
	       'Better not tell you now',
	       'Cannot predict now',
	       'Concentrate and ask again',
	       'Don\'t count on it',
	       'My reply is: no',
	       'My sources say: no',
	       'Outlook: not so good',
	       'Very doubtful']

  include Cinch::Plugin
  
  match "8ball"

  def execute(m)
    puts('h')
    m.reply @@answers[rand(0..@@answers.length-1)]
  end
end
