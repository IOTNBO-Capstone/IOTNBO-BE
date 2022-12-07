require 'rails_helper'

RSpec.describe Types::QueryType do

  before :each do
    labels_array = [ "Low Cost",
                     "Sliding Scale",
                     "Works with Anxiety",
                     "Works with Depression",
                     "Works with Addiction"
                    ]

    @practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com") 
    @practice_2 = Practice.create!(name: "Private Practice", website_url: "WWW.bobmckay.com") 
    @practice_3 = Practice.create!(name: "#{Faker::Movies::LordOfTheRings.location} therapy", website_url: Faker::Internet.url) 

    @therapist_1 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: "here to stay", labels: ["Low Cost", "Works with Addiction"], practice_id: @practice_1.id, name: "Sarah Jones")
    @therapist_2 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: "slightly different", labels: ["Sliding Scale", "Low Cost"], practice_id: @practice_1.id, name: "Peter Piper")
    @therapist_3 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: "even more different", labels: ["Works with Depression", "Works with Anxiety"], practice_id: @practice_3.id, name: "Bob McKay")
  end

  describe 'display therapist' do
    it 'can query therapist' do
      result = IotnboBeSchema.execute(query).as_json
      expect(result["data"]).to be_a Hash
      expect(result["data"]).to have_key("therapist")
      expect(result["data"]["therapist"]).to be_a Hash

      expect(result["data"]["therapist"]).to have_key("id")
      expect(result["data"]["therapist"]).to have_key("name")
      expect(result["data"]["therapist"]).to have_key("phoneNumber")
      expect(result["data"]["therapist"]).to have_key("imageUrl")
      expect(result["data"]["therapist"]).to have_key("bio")
      expect(result["data"]["therapist"]).to have_key("labels")
      expect(result["data"]["therapist"]).to have_key("practice")
      expect(result["data"]["therapist"]).to have_key("address")

      expect(result["data"]["therapist"]).to have_key("practice")
      expect(result["data"]["therapist"]["practice"]).to be_a Hash

      expect(result["data"]["therapist"]["practice"]).to have_key("id")
      expect(result["data"]["therapist"]["practice"]).to have_key("name")
      expect(result["data"]["therapist"]["practice"]).to have_key("websiteUrl")
    end
  end

  def query
    <<~GQL
    {
      therapist(id: #{@therapist_1.id}) {
        id
        address
        phoneNumber
        imageUrl
        bio
        labels
        name
        practice {
          id
          name
          websiteUrl
        }
      }
    }
    GQL
  end
end