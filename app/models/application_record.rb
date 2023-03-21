class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_response
 
  private
    def render_not_found_response
     render json: {error: "#{controller_name.classify} not found"}, status: :not_found
    end
    def render_unprocessable_response(invalid)
     render json: { errors: invalid.record.errors}, status: :unprocessable_entity
    end 
 end