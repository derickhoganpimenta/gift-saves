class NonProfitsController < ApplicationController
    def index
        @non_profits = NonProfit.all
    end

    def show
        @non_profit = NonProfit.friendly.find(params[:slug])
        @non_profits = NonProfit.where.not(id: @non_profit.id)
    end

    def search      
      by_categories = NonProfit.joins(:categories).where("categories.name ILIKE ?", "%#{search_params[:query]}%")
      by_non_profits_name = NonProfit.where("name ILIKE ?", "%#{search_params[:query]}%")
      @non_profits = (by_categories + by_non_profits_name).uniq
      render json: by_categories.to_sql
    end

    private

    def search_params
      params.require(:search).permit(:query)
    end
end
