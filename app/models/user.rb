class User < ApplicationRecord
  has_many :budgetbooks, :dependent => :destroy
  has_many :posts, :dependent => :destroy

  GUEST_USER_EMAIL = "guest@example.com".freeze

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end

  def guest?
    email == 'guest@example.com'
  end

  validates :name, presence: true, length: { minimum: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
