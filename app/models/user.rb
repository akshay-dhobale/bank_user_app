class User < ApplicationRecord
	has_secure_password

	has_one :account

	validates_uniqueness_of :phone_number, :email

	validates_presence_of :phone_number, :email
end
