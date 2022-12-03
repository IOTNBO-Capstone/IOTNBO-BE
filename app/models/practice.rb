class Practice < ApplicationRecord
  has_many :therapists

  validates :name, presence: true
  validates :website_url, presence: true, uniqueness: true
end
