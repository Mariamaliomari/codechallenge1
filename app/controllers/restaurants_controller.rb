class RestaurantsController < ApplicationController


    def index
        restaurant = Restaurant.all
        render json:restaurant ,except: [:created_at, :updated_at]
      end
  
      def show
       restaurant = Restaurant.find(params[:id])
       render json: restaurant.as_json(include: { pizzas: {only: [:id, :name, :ingredients]}},except:[:created_at, :updated_at]), status: :ok
      end
      
      def destroy 
       restaurant = Restaurant.find(params[:id])
       restaurant.destroy
       render json: {}
      end
  
      def create
        restaurant = Restaurant.create(restaurant_params)
        render json: restaurant, status: :ok
      end
  
      private
       def restaurant_params
          params.permit(:name, :address)
       end
end
