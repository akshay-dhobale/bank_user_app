class ApplicationController < ActionController::Base
	def current_user
		if request.headers['phone-number']
			@current_user = User.find_by(phone_number: request.headers['phone-number'])
		else
			render json: {error: "please login"} and return
		end
	end
end
