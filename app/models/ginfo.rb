class Ginfo < ApplicationRecord
  belongs_to :user
  has_many :Languages, dependent: :destroy
  has_many :scenes, dependent: :destroy
  has_many :treats, dependent: :destroy
  has_many :areas, dependent: :destroy

  validates :tel_number, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
  validates :sex, presence: true
  validates :face_picture, presence: true
end
