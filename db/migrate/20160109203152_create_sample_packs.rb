class CreateSamplePacks < ActiveRecord::Migration
  def change
    create_table :sample_packs do |t|

      t.timestamps null: false
    end
  end
end
