class AddTitleToSound < ActiveRecord::Migration
  def change
    add_column :sounds, :title, :string
  end
end
