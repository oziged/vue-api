module Api
  class PlansController < ApplicationController

    def show
      @plan = Plan.find(params[:id])
      # render json: @plan

      test = PlanSerializer.new(@plan).serializable_hash

      render json: test

      # array = []

      # @plan.checkpoints.each {|item|
        # array.push(item)
      # }

      # render :json => @plan.to_json(:include => :checkpoints)
      # render json: array

      # Category.joins(articles: [{ comments: :guest }, :tags])

      # # temp def #

      # def get_checkpoints (plan)
      #   array = []

      #   plan.checkpoints.each { |parent| 
      #     array.push({

      #     })
      #     get_nested(parent)
      #   }

      #   def get_nested (parent)

      #   end
      # end

      # # # # # # # #

      # @plan = Plan.find(params[:id])
      # array = get_checkpoints(@plan)

      # # render json: checkpoints
      # # rescue
      # #   render json: {
      # #     error: "Data not found",
      # #     status: 404
      # #   }, status: 404
    end


    def create
      @user = User.find(1)
      @plan = @user.plans.new(plan_params)

      if @plan.save
        render json: @plan
      else 
        render json: {
          error: "Data is invalid",
          status: 400
        }, status: 400
      end
    end


    def index
      # result = Plans::Search(query)
      
      plans = []

      # FILTER #

      # offset && limit
      offset = params[:offset].to_i || 0
      limit = params[:limit].nil? ? 10 : params[:limit].to_i
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

      puts 'plans' * 10
      puts plans.inspect
      puts 'plans' * 10

      render json: plans
    end


    private 
      def filter_sort_params
    end

    def plan_params
      params.permit(:title, :description)
    end
  end
end