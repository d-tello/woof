class Message < ApplicationRecord
  belongs_to :chatroom
  validates :content, presence: true,
    length: { maximum: 1000, too_long: '%{count} characters is the maximum allowed' },
    length: { minimum: 2, too_short: '%{count} characters is the minimal length' };
end
