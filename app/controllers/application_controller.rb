class ApplicationController < ActionController::Base
	def current_user
		if session[:user_id]
			current_user ||= User.find(session[:user_id])
			if current_user.phone_number == request.headers.[:phone_number] && current_user.present?
				@current_user = current_user
			else
				render json: {error: "please login"} and return
			end
		else
			render json: {error: "please login"} and return
		end
	end
end
