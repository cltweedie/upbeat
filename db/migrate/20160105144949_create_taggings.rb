class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :sound_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
