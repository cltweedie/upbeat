class AddTitleAndFileToSamplePacks < ActiveRecord::Migration
  def change
    add_column :sample_packs, :title, :string
    add_column :sample_packs, :file, :string
  end
end
