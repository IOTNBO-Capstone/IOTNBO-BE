class Therapist < ApplicationRecord
  belongs_to :practice

  validates :address, presence: true
  validates :phone_number, presence: true
  validates :image_url, presence: true
  validates :bio, presence: true
  validates :labels, presence: true
  validates :name, presence: true
  validates :phone_number, presence: true
end
