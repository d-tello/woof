class DogsPark < ApplicationRecord
  belongs_to :dog
  has_many :parks
end
