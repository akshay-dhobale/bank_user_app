class AccountsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :current_user

	def create
		account = Account.new(user: @current_user)
		if account.save
			render json: {status: "success"} and return
		else
			render json: {errors: {error: 'invalid_params', error_description: account.errors.full_messages}}, status: :unprocessable_entity and return
		end
	end

	def get_details
		account = @current_user.account

		if account.present?
			render json: {name: @current_user.name, email: @current_user.email, balance: account.balance, account_number: account.account_number}
		else
			render json: {error: "please login"} 
		end
	end



end
#test
