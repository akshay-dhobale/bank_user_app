class ApplicationController < ActionController::Base
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		else
			render json: {error: "please login"} and return
		end
	end
end
