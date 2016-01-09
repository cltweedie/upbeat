class AddTypeToProducers < ActiveRecord::Migration
  def change
    add_column :producers, :type, :string
  end
end
