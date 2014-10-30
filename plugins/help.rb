require 'cinch'

class Help
  include Cinch::Plugin

  match "help"

  def execute(m)
    m.reply("List of commands:", "/cprivmsg #{m.user.nick}")
    
    bot.plugins.each do |p|
      if p.respond_to? :help
	m.reply(p.help, "/cprivmsg #{m.user.nick}")
      end
    end
  end
end
