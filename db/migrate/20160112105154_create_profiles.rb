class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :producer_id
      t.string :username
      t.text :bio

      t.timestamps null: false
    end
  end
end
