require 'rails_helper'

RSpec.describe 'create therapist' do
  it 'creates a therapists and returns the therapist details' do
    @practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com")

    query = <<~GQL
      mutation {
        createTherapist(input: {
          name: "Bingo McAllister",
          address: "888 Your Mom's House Cul-de-Sac",
          phoneNumber: "555-555-5555",
          labels: ["Sliding Scale"],
          imageUrl: "https://www.nonsense.com/bingo.jpg",
          bio: "It's a Bingo!!!",
          practiceId: #{@practice_1.id}
          }) {
          therapist {
              id,
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

    result = IotnboBeSchema.execute(query)
    therapist = result.dig("data", "createTherapist", "therapist")

    expect(therapist["name"]).to eq("Bingo McAllister")
    expect(therapist["address"]).to eq("888 Your Mom's House Cul-de-Sac")
    expect(therapist["phoneNumber"]).to eq("555-555-5555")
    expect(therapist["labels"]).to eq("[\"Sliding Scale\"]")
    expect(therapist["imageUrl"]).to eq("https://www.nonsense.com/bingo.jpg")
    expect(therapist["bio"]).to eq("It's a Bingo!!!")
    expect(therapist["practiceId"]).to eq(@practice_1.id)
  end
end

