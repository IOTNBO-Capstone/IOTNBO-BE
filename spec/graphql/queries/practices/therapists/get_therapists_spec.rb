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
    @therapist_4 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: "even more different", labels: ["Works with Depression", "Works with Anxiety"], practice_id: @practice_3.id, name: "Bob McKay")
    @therapist_5 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: "even more different", labels: ["Works with Depression", "Works with Anxiety"], practice_id: @practice_3.id, name: "Bob McKay")
  end

  describe 'display therapists' do
    it 'can query therapists' do
      result = IotnboBeSchema.execute(query).as_json
      expect(result["data"]).to be_a Hash
      expect(result["data"]).to have_key("therapists")
      expect(result["data"]["therapists"]).to be_a Array
      expect(result["data"]["therapists"].count).to eq 5

      result["data"]["therapists"].each do |therapist|
        expect(therapist).to have_key("id")
        expect(therapist).to have_key("name")
        expect(therapist).to have_key("phoneNumber")
        expect(therapist).to have_key("imageUrl")
        expect(therapist).to have_key("bio")
        expect(therapist).to have_key("labels")
        expect(therapist).to have_key("practice")
        expect(therapist).to have_key("address")
      end
    end

    it 'can query therapists with certain label' do
      result = IotnboBeSchema.execute(query_labels).as_json
      expect(result["data"]).to be_a Hash
      expect(result["data"]).to have_key("therapists")
      expect(result["data"]["therapists"]).to be_a Array
      expect(result["data"]["therapists"].count).to eq 2

      result["data"]["therapists"].each do |therapist|
        expect(therapist).to have_key("id")
        expect(therapist).to have_key("name")
        expect(therapist).to have_key("phoneNumber")
        expect(therapist).to have_key("imageUrl")
        expect(therapist).to have_key("bio")
        expect(therapist).to have_key("labels")
        expect(therapist).to have_key("address")
        expect(therapist).to have_key("practice")
        expect(therapist["practice"]).to be_a Hash

        expect(therapist["practice"]).to have_key("id")
        expect(therapist["practice"]).to have_key("name")
        expect(therapist["practice"]).to have_key("websiteUrl")
      end
    end

    it 'can query therapists and return a uniq array' do
      result = IotnboBeSchema.execute(query_multiple_labels).as_json
      expect(result["data"]).to be_a Hash
      expect(result["data"]).to have_key("therapists")
      expect(result["data"]["therapists"]).to be_a Array
      expect(result["data"]["therapists"].count).to eq 3

      result["data"]["therapists"].each do |therapist|
        expect(therapist).to have_key("id")
        expect(therapist).to have_key("name")
        expect(therapist).to have_key("phoneNumber")
        expect(therapist).to have_key("imageUrl")
        expect(therapist).to have_key("bio")
        expect(therapist).to have_key("labels")
        expect(therapist).to have_key("address")
        expect(therapist).to have_key("practice")
        expect(therapist["practice"]).to be_a Hash

        expect(therapist["practice"]).to have_key("id")
        expect(therapist["practice"]).to have_key("name")
        expect(therapist["practice"]).to have_key("websiteUrl")
      end
    end
  end

  def query
    <<~GQL
    {
      therapists {
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

  def query_labels
    <<~GQL
    {
      therapists(labels: ["Low Cost"]) {
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

  def query_multiple_labels
    <<~GQL
    {
      therapists(labels: ["Works with Anxiety", "Works with Depression"]) {
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