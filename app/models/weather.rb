require 'net/http'

class Weather 

	def initialize(location)
		@location = city

	end

	def self.api_key
		@api_key = "2c9bbced7e19e5b7"
	end

	def get_weather
		uri = URI("http://api.wunderground.com/api/#{Weather.api_key}/conditions/q/#{@location}")
	end

end
