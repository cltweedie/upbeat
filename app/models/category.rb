class Category < ActiveRecord::Base

  has_many :sounds

  def self.select_options
    Category.all.map { |i| [ i.name, i.id ] }
  end
end
