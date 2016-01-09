class AddSellerIdToSamplePacks < ActiveRecord::Migration
  def change
    add_column :sample_packs, :seller_id, :integer
  end
end
