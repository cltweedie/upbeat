class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.integer :producer_id
      t.string :file

      t.timestamps null: false
    end
  end
end
