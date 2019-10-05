class Ginfo < ApplicationRecord
  belongs_to :user
  has_many :Languages, dependent: :destroy
  has_many :scenes, dependent: :destroy
  has_many :treats, dependent: :destroy
  has_many :areas, dependent: :destroy
end
