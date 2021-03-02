class Dog < ApplicationRecord
  belongs_to :user
  has_many :dogs_parks
  has_many :sniffs_as_sniffer, source: :sniffs, foreign_key: :sniffer_id
  has_many :sniffs_as_sniffed, source: :sniffs, foreign_key: :sniffed_id
end
