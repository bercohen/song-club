class Group < ApplicationRecord
	has_many :members
  	has_many :users, through: :members
  	has_many :concerts
  	belongs_to :admin, class_name: 'User', foreign_key: :user_id

  

end
