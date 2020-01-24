class Transaction < ApplicationRecord
	belongs_to :account
	enum type: [:credit, :debit]
	enum status: [:init, :success, :failed]

	before_save :add_txn_id

	def add_txn_id
		self.transaction_id = SecureRandom.hex(7)
	end
end
