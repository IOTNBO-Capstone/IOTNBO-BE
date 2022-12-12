require 'rails_helper'

RSpec.describe Therapist, type: :model do
  describe "validations" do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_length_of(:phone_number) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:bio) }
    it { should validate_presence_of(:labels) }
    it { should validate_presence_of(:name) }
    it { should allow_value("3035069305").for(:phone_number) }
    it { should_not allow_value("30#5069305").for(:phone_number) }
  end

  describe "relationships" do
    it { should belong_to :practice }
  end

  describe "format" do

  end
end
