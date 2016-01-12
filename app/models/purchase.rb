class Purchase < ActiveRecord::Base

  belongs_to :producer
  belongs_to :sample_pack

end
