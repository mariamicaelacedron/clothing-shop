class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum :role, { user: 0, admin: 1 }, default: :user
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :role, presence: true
  
  has_many :products, dependent: :destroy
  
  def admin?
    role == 'admin'
  end
end 