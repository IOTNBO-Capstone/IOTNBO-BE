require 'rails_helper'

RSpec.describe Practice, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:website_url) }
    it { should validate_uniqueness_of(:website_url) }
  end

  describe "relationships" do
    it { should have_many :therapists }
  end
end
