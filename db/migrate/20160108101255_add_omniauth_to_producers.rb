class AddOmniauthToProducers < ActiveRecord::Migration
  def change
    add_column :producers, :provider, :string
    add_index :producers, :provider
    add_column :producers, :uid, :string
    add_index :producers, :uid
  end
end
