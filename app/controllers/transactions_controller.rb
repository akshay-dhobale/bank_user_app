class TransactionsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :current_user
	before_action :get_account

	def create
		render json: {error: 'open account'} if @account.blank?
		if params[:txn_type] == 'add' || "withdraw"
			@transaction = Transaction.new(account: @account, amount: txn_params[:amount], status: 0)
			@transaction.type = params[:txn_type] == "add" ? 0 : 1
			if @transaction.save

				txn = send("#{params[:txn_type]}")
				if txn
					@transaction.success!
					render json: {status: "success", transaction_id: @transaction.transaction_id} and return
				else
					@transaction.failed!
					render json: {status: "failed", transaction_id: @transaction.transaction_id} and return
				end
			else
				@transaction.failed!
				render json: {status: "failed", transaction_id: @transaction.transaction_id} and return
			end
		else
			render json: {error: "wrong action"} and return
		end
	end

	def get_details
		
	end

	private

	#to add money in account
	def add
		@account.balance += txn_params[:amount]
		if @account.save
			return true
		else
			return false
		end 
	end

	#to withdraw money from account
	def withdraw
		if @account.balance >= txn_params[:amount]
			@account.balance -= txn_params[:amount]
			if @account.save
				return true
			else
				return false
			end
		else
			return false
		end
	end

	def txn_params
		params.permit(:amount)
	end

	def get_account
		@account = @current_user.account
	end
end