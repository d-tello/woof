class Park < ApplicationRecord
  has_many :dogs_parks

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
