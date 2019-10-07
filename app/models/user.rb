class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # ,:trackable
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :ginfos, dependent: :destroy

  validates :username, presence: true, length: { minimum: 1, maximum: 20 }
  validates :email, presence: true
  validates :password, presence: true

end
