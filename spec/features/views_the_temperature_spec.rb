require 'spec_helper'

feature 'viewing the temperature', %q{
	As a user
	I want to input my zipcode
	to view the temperature
} do 



	scenario 'view the temperature', focus: true do 
		visit pages_index_path
		fill_in 'Weather_zipcode', :with => '01904'
		click_on 'ZipCode'
		expect(page).to have_content("80.1 F")
	end
end
