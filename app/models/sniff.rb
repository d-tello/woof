class Sniff < ApplicationRecord
  belongs_to :sniffer, class_name: 'Dog'
  belongs_to :sniffed, class_name: 'Dog'
  has_many :chatrooms, dependent: :destroy
end
