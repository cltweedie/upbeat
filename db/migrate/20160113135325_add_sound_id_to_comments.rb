class AddSoundIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :sound_id, :integer
  end
end
