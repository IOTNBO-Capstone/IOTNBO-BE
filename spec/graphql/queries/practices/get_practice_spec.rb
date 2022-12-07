require 'rails_helper'

RSpec.describe Types::QueryType do

  before :each do
    @practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com") 
    @practice_2 = Practice.create!(name: "Private Practice", website_url: "WWW.bobmckay.com") 
    @practice_3 = Practice.create!(name: "#{Faker::Movies::LordOfTheRings.location} therapy", website_url: Faker::Internet.url) 
  end

  describe 'display practice' do
    it 'can query one practice' do
      result = IotnboBeSchema.execute(query).as_json
      expect(result["data"]["practice"]).to be_a Hash
      expect(result["data"]["practice"]["name"]).to eq("#{@practice_1.name}")
      expect(result["data"]["practice"]["name"]).to_not eq("#{@practice_2.name}")
      expect(result["data"]["practice"]["name"]).to_not eq("#{@practice_3.name}")

      expect(result["data"]["practice"]).to have_key("id")
      expect(result["data"]["practice"]).to have_key("name")
      expect(result["data"]["practice"]).to have_key("websiteUrl")
    end
  end

  def query
    <<~GQL
    {
      practice(id: "#{@practice_1.id}") {
        id
        name
        websiteUrl
      }
    }
    GQL
  end
end