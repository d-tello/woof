class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :viewed_park, class_name: 'Park', optional: true
  has_many :dogs_parks, dependent: :destroy
  has_many :parks, through: :dogs_parks, dependent: :destroy
  has_many :sniffs_as_sniffer, class_name: 'Sniff', foreign_key: :sniffer_id, dependent: :destroy
  has_many :sniffs_as_sniffed, class_name: 'Sniff', foreign_key: :sniffed_id, dependent: :destroy

  validates :name, presence: true
  validates :breed, presence: true
  validates :age, presence: true, numericality: true
  validates :bio, presence: true

  has_many_attached :photos, dependent: :destroy
end
