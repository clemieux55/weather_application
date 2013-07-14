require 'spec_helper'

describe 'Weather' do 
	let(:city) { 'Lynn' }

	it 'gets the weather information for the city specified' do 

		result = Weather.new(city)
		expect(result).to be_kind_of(Weather)
	end

	it 'gives the temperature when returned' do 

		result = Weather.new(city)
		expect(result.temperature).to be_kind_of(Integer)
	end

end

