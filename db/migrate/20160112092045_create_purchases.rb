class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :producer_id
      t.integer :sample_pack_id

      t.timestamps null: false
    end
  end
end
