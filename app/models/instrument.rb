class Instrument < ActiveRecord::Base

  has_many :sounds

  def self.select_options
    Instrument.all.map { |i| [ i.name, i.id ] }
  end
end
