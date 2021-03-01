class Dog < ApplicationRecord
  belongs_to :user
  has_many :dogs_parks
end
