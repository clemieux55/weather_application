require 'spec_helper'

feature 'current condition', %q{
	As a user
	I want to view the current condition
	So i can know what is happening outside
} do 



	let(:result) { Weather.new('01904') }

	scenario 'current condition' do

	visit pages_index_path
	fill_in 'Weather_zipcode', with: '01904'
		VCR.use_cassette('weather') do 
			click_on 'ZipCode'
			expect(page).to have_content('Mostly Cloudy')
		end
	end
end


VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

