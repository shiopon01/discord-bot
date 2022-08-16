require 'discordrb'

TOKEN = ENV.fetch('DISCORD_TOKEN', nil)
CLIENT_ID = ENV.fetch('DISCORD_CLIENT_ID', nil)

bot = Discordrb::Commands::CommandBot.new(
  token: TOKEN,
  client_id: CLIENT_ID,
  prefix: '/'
)

# command
bot.command :hello do |event|
  break unless event.channel.name == 'discord-bot-test'

  event.send_message("hallo, #{event.user.name}")
end

# message
bot.message do |event|
  break unless event.channel.name == 'discord-bot-test'

  event.respond 'hogehoege'
end

bot.run
