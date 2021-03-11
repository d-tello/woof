class Chatroom < ApplicationRecord
  belongs_to :sniff
  has_many :messages, dependent: :destroy
end
