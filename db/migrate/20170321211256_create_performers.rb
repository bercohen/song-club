class CreatePerformers < ActiveRecord::Migration[5.0]
  def change
    create_table :performers do |t|
      t.integer :user_id
      t.integer :concert_id
      t.integer :status

      t.timestamps
    end
  end
end
