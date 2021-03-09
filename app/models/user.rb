class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { in: 3..20 }
  has_many :dogs, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  after_create :generate_code

  def generate_code
    self.code = SecureRandom.hex
    save
  end
end
