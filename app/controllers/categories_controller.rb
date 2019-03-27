class CategoriesController < ApplicationController
	def search
		@category = params[:name]
		@non_profits = Category.find_by(name: params[:name]).non_profits
	end
end
