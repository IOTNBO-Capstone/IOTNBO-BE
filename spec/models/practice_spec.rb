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

  describe "creation of practice" do
    it "can have multiple therapists for a practice" do
      practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABC.com") 
      practice_2 = Practice.create!(name: "Private Practice", website_url: "WWW.bob-mckay.com") 
      therapist_1 = Therapist.create!(address: "101 main st", phone_number: "303-888-8888", image_url: "www.pic.com", bio: "here to stay", labels: ["anxiety", "depression", "substance abuse"], practice_id: practice_1.id, name: "Sarah Jones")
      therapist_2 = Therapist.create!(address: "101 main st", phone_number: "303-888-8888", image_url: "www.pic2.com", bio: "slightly different", labels: ["low income", "depression", "substance abuse"], practice_id: practice_1.id, name: "Peter Piper")
      therapist_3 = Therapist.create!(address: "8 MLK BLVD", phone_number: "303-555-5555", image_url: "www.pic3.com", bio: "even more different", labels: ["sliding scale", "grief", "substance abuse"], practice_id: practice_2.id, name: "Bob McKay")

      expect(practice_1.therapists.count).to eq(2)
      expect(practice_1.therapists).to eq([therapist_1, therapist_2])
      expect(practice_1.therapists).to_not include(therapist_3)

      expect(practice_2.therapists.count).to eq(1)
    end
  end
end
