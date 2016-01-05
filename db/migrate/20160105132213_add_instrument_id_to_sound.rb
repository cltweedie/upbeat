class AddInstrumentIdToSound < ActiveRecord::Migration
  def change
    add_column :sounds, :instrument_id, :integer
  end
end
