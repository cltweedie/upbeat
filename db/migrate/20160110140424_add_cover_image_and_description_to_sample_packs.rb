class AddCoverImageAndDescriptionToSamplePacks < ActiveRecord::Migration
  def change
    add_column :sample_packs, :cover_image, :string
    add_column :sample_packs, :description, :text
  end
end
