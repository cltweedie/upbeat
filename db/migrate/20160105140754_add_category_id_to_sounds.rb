class AddCategoryIdToSounds < ActiveRecord::Migration
  def change
    add_column :sounds, :category_id, :integer
  end
end
