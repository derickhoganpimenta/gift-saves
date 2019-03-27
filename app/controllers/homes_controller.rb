class HomesController < ApplicationController
  def index
    @categories = Category.order("name asc")
    @non_profits = NonProfit.limit(4)    
  end
end
