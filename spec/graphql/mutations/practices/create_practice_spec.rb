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

  it 'SAD PATH: returns and error if practice query is incomplete' do

    query = <<~GQL
      mutation {
        createPractice(input: {
          name: "",
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
    message = result.dig("data", "createPractice", "errors")

    expect(message).to include("Name can't be blank")
  end
end