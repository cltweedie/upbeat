class AddPriceToSamplePacks < ActiveRecord::Migration
  def change
    add_column :sample_packs, :price, :decimal, precision: 8, scale: 2
  end
end
