class Concert < ApplicationRecord
	has_many :performers
  	has_many :users, through: :performers
  	belongs_to :group
end
