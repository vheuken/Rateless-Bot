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

private

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
    wind_speed_mps = current_weather['wind']['speed']
    wind_speed_mph = (wind_speed_mps * 0.000621371 * 60**2).round(2)
    wind_direction_degrees = current_weather['wind']['deg']
    cardinal_wind_direction = degrees_to_cardinal(wind_direction_degrees)
    weather_description = current_weather['weather'][0]['description']

    s = "Weather for #{city} (#{country}): "
    s += "#{temp_celsius}°C (#{temp_fahrenheit}°F); #{humidity}% humidity; "
    s += "#{wind_speed_mps}m/s (#{wind_speed_mph}mph) winds "
    s += "blowing #{cardinal_wind_direction} (#{wind_direction_degrees}°); "
    s += "#{weather_description}"
  end

  def degrees_to_cardinal(degree)
    case degree
      when ((degree >= 348.75) or 0..11.25)
	'North'
      when 11.25..33.75
	'North-Northeast'
      when 33.75..56.25
	'Northeast'
      when 56.25..78.75
	'East-Northeast'
      when 78.75..101.25
	'East'
      when 101.25..123.75
	'East-Southeast'
      when 123.75..146.25
	'Southeast'
      when 146.25..168.75
      	'South-Southeast'
      when 168.75..191.25
	'South'
      when 191.25..213.75
	'South-Southwest'
      when 213.75..236.25
	'Southwest'
      when 236.25..258.75
	'West-Southwest'
      when 258.75..281.25
	'West'
      when 281.25..303.75
	'West-Northwest'
      when 303.75..326.25
	'Northwest'
      when 326.25..348.75
	'North-Northwest'
    end
  end
end
