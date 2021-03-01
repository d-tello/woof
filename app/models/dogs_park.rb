class DogsPark < ApplicationRecord
  belongs_to :dog
  belongs_to :park
end
