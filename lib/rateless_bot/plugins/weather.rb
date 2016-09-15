require 'cinch'
require 'open_weather'
require 'countries'

class Weather
  def help
    '!weather CITY/ZIP - gets the current temperature for a given city/zip'
  end

  include Cinch::Plugin

  def initialize(*args)
    super
    @options = { units: 'metric', APPID: config[:api_key] }
  end

  match /weather [^\s-]/

  def execute(m)
    city = m.message.split('!weather ')[1]

    current_weather = OpenWeather::Current.city(city, @options)

    m.reply make_current_weather_str(current_weather)
  end

  def make_current_weather_str(current_weather)
    if current_weather['cod'] == '404'
      return 'Error: City not found'
    elsif current_weather['cod'] != 200 # number is not a string; report bug
      return "Error: response code #{current_weather['cod']}"
    end

    city = current_weather['name']
    country = ISO3166::Country.new(current_weather['sys']['country']).name
    humidity = current_weather['main']['humidity']
    temp_celsius = current_weather['main']['temp'].round(1)
    temp_fahrenheit = (temp_celsius * 1.8 + 32).round(1)
    weather_description = current_weather['weather'][0]['description']

    s = "Weather for #{city} (#{country}): "
    s += "#{temp_celsius}°C (#{temp_fahrenheit}°F); #{humidity}% humidity; "
    s += "#{weather_description}"
  end
end
