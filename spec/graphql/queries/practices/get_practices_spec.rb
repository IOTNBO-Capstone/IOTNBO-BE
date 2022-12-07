require 'rails_helper'

RSpec.describe Types::QueryType do

  before :each do
    @practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com") 
    @practice_2 = Practice.create!(name: "Private Practice", website_url: "WWW.bobmckay.com") 
    @practice_3 = Practice.create!(name: "#{Faker::Movies::LordOfTheRings.location} therapy", website_url: Faker::Internet.url) 
  end

  describe 'display practices' do
    it 'can query practices' do
      result = IotnboBeSchema.execute(query).as_json
      expect(result["data"]).to be_a Hash
      expect(result["data"]).to have_key("practices")
      expect(result["data"]["practices"]).to be_a Array
      expect(result["data"]["practices"].count).to eq 3

      result["data"]["practices"].each do |practice|
        expect(practice).to have_key("id")
        expect(practice).to have_key("name")
        expect(practice).to have_key("websiteUrl")
      end
    end
  end

  def query
    <<~GQL
    {
      practices {
        id
        name
        websiteUrl
      }
    }
    GQL
  end
end