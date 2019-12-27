module Api
  class PlansController < ApplicationController
    def show
      @plan = Plan.find(params[:id])
      render json: @plan
    end

    def index
      puts '#' * 100
      puts Plan.test.inspect
      puts '#' * 100
      # result = Plans::Search(query)
      
      plans = []

      # FILTER #

      # offset && limit
      offset = params[:offset].to_i || 0
      limit = params[:limit].to_i || 10
      max = Plan.maximum(:id)
      plans = Plan.where("id <= ? AND id > ?", max-offset, max-offset-limit)
      # # # # # # # # # #

      # price
      if params[:price]
        price = params[:price].split('-').map { |item| item.to_i}
        plans = plans.select { |plan| plan.price >= price[0] && plan.price <= price[1] }
      end
      # # # # # # # # # #

      # rating
      if params[:rating]
        rating = params[:rating].split('-').map { |item| item.to_i}
        plans = plans.select { |plan| plan.rating >= rating[0] && plan.rating <= rating[1] }
      end
      # # # # # # # # # #

      # FILTER #

      # - - - - - - - - - - -

      # SORT #

      # rating
      plans = plans.sort_by { |plan| plan.rating } if (params[:sort] == 'rating-min')
      plans = plans.sort_by { |plan| plan.rating }.reverse if (params[:sort] == 'rating-max')
      # # # # # # # # # #

      # SORT #

      render json: plans
    end

    private 
    def filter_sort_params
    end
  end
end