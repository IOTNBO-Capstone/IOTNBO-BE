require 'rails_helper'

RSpec.describe 'create practice' do
  it 'creates a practice and returns the practice details' do

    query = <<~GQL
      mutation {
        createPractice(input: {
          name: "XYZ Therapy",
          websiteUrl: "www.xyztherapy.com"
        }) {
          practice {
            id,
            name,
            websiteUrl
          }
          errors
        }
      }
    GQL

    result = IotnboBeSchema.execute(query)
    practice = result.dig("data", "createPractice", "practice")

    expect(practice["name"]).to eq("XYZ Therapy")
    expect(practice["websiteUrl"]).to eq("www.xyztherapy.com")
  end
end 