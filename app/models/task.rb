class Task < ActiveRecord::Base
	# validates :title, presence: true
	# validates :name, :login, :email, presence: true
	validates :title, length: { minimum: 3, maximum: 12 }
end
