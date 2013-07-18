class WeathersController < ApplicationController

	def index
		if params['Weather'][:zipcode]
			weather = Weather.new(params['Weather'][:zipcode])
			@weather = weather.conditions
		else
			flash[:notice] = 'Enter valid zipcode'
		end
	end

	def create
		@todo = Todo.new(params[:todo])
	end

	def show
		@todo = Todo.find(params[:todo])
	end

end
