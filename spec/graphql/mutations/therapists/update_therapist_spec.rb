require 'rails_helper'

RSpec.describe 'update therapist' do
  it 'updates a therapist and returns the therapist details' do
    practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com") 
    therapist_1 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(333)-333-3333", image_url: Faker::LoremFlickr.image, bio: "here to stay", labels: ["Low Cost", "Sliding Scale", "Works with Anxiety"], practice_id: practice_1.id, name: "Sarah Jones")

    mutation = <<~GQL
      mutation {
        updateTherapist(input: {
          id: #{therapist_1.id},
          bio: "Sarah's updated bio"
          }) {
            therapist {
                name,
                address,
                phoneNumber,
                labels,
                imageUrl,
                bio,
                practiceId
            }
            errors
          }
        }
      GQL

    result = IotnboBeSchema.execute(mutation)
    therapist = result.dig("data", "updateTherapist", "therapist")

    expect(therapist["name"]).to eq("Sarah Jones")
    expect(therapist["bio"]).to eq("Sarah's updated bio")
    expect(therapist["bio"]).to_not eq("here to stay")
  end
  
  it 'shouldnt allow invalid phone_number formats' do
    practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com") 
    therapist_1 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(333)-333-3333", image_url: Faker::LoremFlickr.image, bio: "here to stay", labels: ["Low Cost", "Sliding Scale", "Works with Anxiety"], practice_id: practice_1.id, name: "Sarah Jones")

    mutation = <<~GQL
      mutation {
        updateTherapist(input: {
          id: #{therapist_1.id},
          phoneNumber: "333.333.3333"
          }) {
            therapist {
                name,
                address,
                phoneNumber,
                labels,
                imageUrl,
                bio,
                practiceId
            }
            errors
          }
        }
      GQL

    result = IotnboBeSchema.execute(mutation)
    message = result.dig("data", "updateTherapist", "errors")
    expect(message).to include("Phone number must be in xxxxxxxxxx format (ten numeric digits without spaces or symbols).")
    therapist = Therapist.find(therapist_1.id)
    expect(therapist.phone_number).to eq("(333)-333-3333")
  end

  it 'should be able to update labels method' do
    practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com") 
    therapist_1 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(333)-333-3333", image_url: Faker::LoremFlickr.image, bio: "here to stay", labels: ["Low Cost", "Sliding Scale", "Works with Anxiety"], practice_id: practice_1.id, name: "Sarah Jones")

    mutation = <<~GQL
      mutation {
        updateTherapist(input: {
          id: #{therapist_1.id},
          labels: ["Low Cost", "Sliding Scale", "Works with Depression"]
          }) {
            therapist {
                name,
                address,
                phoneNumber,
                labels,
                imageUrl,
                bio,
                practiceId
            }
            errors
          }
        }
      GQL

    result = IotnboBeSchema.execute(mutation)
    therapist = result.dig("data", "updateTherapist", "therapist")
    expect(therapist["labels"]).to eq("[\"Low Cost\", \"Sliding Scale\", \"Works with Depression\"]")
    expect(therapist["labels"]).to_not include("Works with Anxiety")
  end

  it 'shouldnt allow update for invalid therapist_id' do
    practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com") 
    therapist_1 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(333)-333-3333", image_url: Faker::LoremFlickr.image, bio: "here to stay", labels: ["Low Cost", "Sliding Scale", "Works with Anxiety"], practice_id: practice_1.id, name: "Sarah Jones")

    mutation = <<~GQL
      mutation {
        updateTherapist(input: {
          id: 0,
          phoneNumber: "333-444-5555"
          }) {
            therapist {
                name,
                address,
                phoneNumber,
                labels,
                imageUrl,
                bio,
                practiceId
            }
            errors
          }
        }
      GQL

    result = IotnboBeSchema.execute(mutation)
    message = result.dig("errors").first["message"]
    expect(message).to include("Therapist not found")
  end
end