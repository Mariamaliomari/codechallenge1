class PizzasController < ApplicationController

    def index
        pizza = Pizza.all
        render json:pizza, except: [:created_at, :updated_at]
    end
  
      def show
       pizza = Pizza.find(params[:id])
       render json: pizza, status: :ok    
      end
end
