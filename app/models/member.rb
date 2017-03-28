class Member < ApplicationRecord
	 enum status: [:requested, :declined, :active, :inactive]
	  belongs_to :user
	  belongs_to :group
end
# if you add to the existing member migration
# t.integer :status, default: :requested

# or you could create a new migration
# rails g migrate add_status_column_to_member_table
#
# add_column :member, :integer, default: :requested