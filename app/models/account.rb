class Account < ApplicationRecord
	belongs_to :user
	has_many :transactions

	validates_uniqueness_of :user_id

	before_save :add_account_number

	def add_account_number
		self.account_number = SecureRandom.hex(6)
	end
end
