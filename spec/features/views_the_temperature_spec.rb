require 'spec_helper'

feature 'viewing the temperature', %q{
	As a user
	I want to input my zipcode
	to view the temperature
} do 

	scenario 'view the temperature'do 
		visit pages_index_path
		fill_in 'Weather_zipcode', :with => '01904'
		VCR.use_cassette('weather') do 
			click_on 'ZipCode'
		end
			expect(page).to have_content('80.1 F (26.7 C)')
	end
end

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end