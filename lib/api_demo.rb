require 'open-uri'
require 'json'

url = 'https://swapi.info/api/planets'

serialized_planets = URI.parse(url).read # string
planets = JSON.parse(serialized_planets)

planets.each do |planet|
  puts '-' * 25
  puts planet['name']
  puts '-' * 25

  puts

  residents = planet['residents']

  residents.each do |resident_url|
    puts JSON.parse(URI.parse(resident_url).read)['name']
  end

  puts
  puts '-' * 25
  puts
end
