require 'net/http'
require 'json'

class Weather 

	def initialize(zipcode)
		@zipcode = zipcode
	end

	def self.api_key
		@api_key = "2c9bbced7e19e5b7"
	end

	def response 
		response = get_weather
	end

	def conditions
		@attributes = {}
		temp = response['current_observation']['temperature_string']
		@attributes[:temp] = temp
		@attributes
	end

	private

	def get_weather
		uri = URI("http://api.wunderground.com/api/#{Weather.api_key}/conditions/q/#{@zipcode}.json")
		response = JSON.parse(Net::HTTP.get(uri))
	end

end
