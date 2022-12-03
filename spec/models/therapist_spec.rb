require 'rails_helper'

RSpec.describe Therapist, type: :model do
  describe "validations" do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:bio) }
    it { should validate_presence_of(:labels) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone_number) }
  end

  describe "relationships" do
    it { should belong_to :practice }
  end
end
