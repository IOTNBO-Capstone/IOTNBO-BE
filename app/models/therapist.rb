class Therapist < ApplicationRecord
  belongs_to :practice

  validates :address, presence: true
  validates :phone_number, presence: true
  validates :image_url, presence: true
  validates :bio, presence: true
  validates :labels, presence: true
  validates :name, presence: true
  validates :phone_number, presence: true

  validates_format_of :phone_number,
                      :with => /[0-9]{10}/,
                      :message => "Phone numbers must be in xxxxxxxxxx format (ten numeric digits without spaces or symbols)."
end
