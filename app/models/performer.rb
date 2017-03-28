class Performer < ApplicationRecord
	enum status: [:requested, :declined, :active, :inactive]
  belongs_to :concert
  belongs_to :user
	  
end	
