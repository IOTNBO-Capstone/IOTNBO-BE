require 'rails_helper'

RSpec.describe 'destroy therapist' do
  it 'destroy a therapists' do
    practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com")
    @therapist_1 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(333)-333-3333", image_url: Faker::LoremFlickr.image, bio: "here to stay", labels: ["Low Cost", "Sliding Scale", "Works with Anxiety"], practice_id: practice_1.id, name: "Sarah Jones")
    @therapist_2 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(444)-333-4444", image_url: Faker::LoremFlickr.image, bio: "The second therapist", labels: ["Low Cost", "Sliding Scale"], practice_id: practice_1.id, name: "Apple Smith")

    
    mutation = <<~GQL
    mutation {
      destroyTherapist(input: {
        id: #{@therapist_1.id},
        }) {
          errors
        }
      }
      GQL
      
    original_therapist_count = Therapist.all.count
    result = IotnboBeSchema.execute(mutation)
    new_therapist_count = Therapist.all.count

    expect(original_therapist_count).to eq(2)
    expect(new_therapist_count).to eq(1)
    expect{Therapist.find(@therapist_1.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

end