require 'cinch'

class Help
  include Cinch::Plugin

  match "help"

  def execute(m)
    m.user.notice("List of commands:")
    
    bot.plugins.each do |p|
      if p.respond_to? :help
	m.user.notice(p.help)
      end
    end
  end
end
