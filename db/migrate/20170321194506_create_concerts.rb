class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :venue
      t.datetime :date
      t.string :address

      t.timestamps
    end
  end
end
