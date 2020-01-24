class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :current_user, only: [:destroy]

    def create
        user = User.find_by_phone_number(params[:phone_number])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          render json: {status: "success"}
        else
          render json: {errors:{error_type:'invalid_params', error_description: "invalid phone_number or password"}}, status: :unprocessable_entity and return
        end
    end

    def destroy
       session[:user_id] = nil
       render json: {status: "success"}
    end
end