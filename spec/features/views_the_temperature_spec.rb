require 'spec_helper'

feature 'viewing the temperature', %q{
	As a user
	I want to input my zipcode
	to view the temperature
} do 



	scenario 'view the temperature' do 
		visit root_path
		fill_in 'Zip Code', :with => '01904'
		expect(page).to have_content(80.1 F (26.7 C))