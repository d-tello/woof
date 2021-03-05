class Message < ApplicationRecord
  belongs_to :chatroom

  belongs_to :user

  validates :content, presence: true,
    length: { maximum: 1000, too_long: '%{count} characters is the maximum allowed',
              minimum: 2, too_short: '%{count} characters is the minimal length' };

end
