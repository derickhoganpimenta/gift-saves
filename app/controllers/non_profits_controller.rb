class NonProfitsController < ApplicationController
    def index
        @non_profits = NonProfit.all
    end

    def show
        @non_profit = NonProfit.friendly.find(params[:slug])
        @non_profits = NonProfit.where.not(id: @non_profit.id)
    end

    def search
      @non_profits = NonProfit.where(categories: search_params[:category])
      #Category.where(id: search_params[:category]).includes(:non_profits)
      #NonProfit.where(name: search_params[:name])
    end

    private

    def search_params
      params.require(:search).permit(:category, :name)
    end
end
