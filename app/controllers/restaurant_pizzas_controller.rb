class RestaurantPizzasController < ApplicationController
    wrap_parameters format: []

    def index
        restaurant = RestaurantPizza.all
        render json:restaurant ,except: [:created_at, :updated_at]
    end
    def create
        restaurant = RestaurantPizza.create!(restauran_params)
        render json: restaurant.pizza, except: [:created_at, :updated_at], status: :ok
    end

    private
     def restauran_params
        params.permit(:price, :pizza_id, :restaurant_id)
     end
end
