require 'spec_helper'

feature 'Todo', %q{
	As a user
	I want to add a Todo
	So I can keep track of things to do
} do 


before :each do 
	visit pages_index_path
	fill_in 'Weather_zipcode', with: '01904'
end

	scenario 'Adding a todo' do 
		VCR.use_cassette('weather') do 
			click_on 'ZipCode'
			expect(page).to have_button('Do the To')
		end
	end

	scenario 'creating a todo' do 
		VCR.use_cassette('weather') do 

			click_on 'ZipCode'

			fill_in 'todo_title', with: 'trash'
			fill_in 'todo_description', with: 'Take out the trash'
			click_on 'Do the To'
			expect(page).to have_content('trash')
			expect(page).to have_content('Take out the trash')
		end
	end
end