module Api
  class PlansController < ApplicationController

    def show
      @plan = Plan.find(params[:id])
      render json: PlanSerializer.new(@plan).serializable_hash.merge!(
        {
          nested: @plan.get_nested_checkpoints,
          places: @plan.get_child_places(@plan)
        }
      )
      # rescue
      #   render json: {
      #     error: "Data not found",
      #     status: 404
      #   }, status: 404
    end


    def create
      def render_error
        render json: {
          error: "Data is invalid",
          status: 400,
          errors: @plan.errors
        }, status: 400
      end

      @user = User.find(1)
      @plan = @user.plans.new(plan_params)
      if @plan.save
        render json: @plan
      else 
        render_error
      end
      
      rescue error
        render_error        
    end


    def index
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