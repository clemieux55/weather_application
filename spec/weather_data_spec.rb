require 'spec_helper'

describe 'Weather' do 

	let(:zip) { '01904' }
	let(:result) { Weather.new(zip) }

	it 'gets the weather information for the city specified' do 
			expect(result).to be_kind_of(Weather)
	end

	it 'returns a hash when response is classed' do 
		VCR.use_cassette('weather') do 	
			expect(result.response.class).to be(Hash)
		end
	end

	it 'returns the temperature of the location' do 
		VCR.use_cassette('weather') do
			expect(result.conditions[:temp]).to eql("80.1 F (26.7 C)")
		end
	end

	it 'returns the temperature of the location' do 
		VCR.use_cassette('weather') do 
			expect(result.conditions[:condition]).to eql('Mostly Cloudy')

		end
	end
end

class VCRTest < Test::Unit::TestCase
  def test_example_dot_com
    VCR.use_cassette('weather') do
      response = Net::HTTP.get_response(URI('http://www.iana.org/domains/example/'))
      assert_match /Example Domains/, response.body
    end
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end