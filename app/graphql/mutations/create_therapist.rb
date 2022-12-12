class Mutations::CreateTherapist < Mutations::BaseMutation
    argument :practice_id, Integer, required: true
    argument :name, String, required: true
    argument :address, String, required: true
    argument :phone_number, String, required: true
    argument :image_url, String, required: true
    argument :bio, String, required: true
    argument :labels, [String]
  
    field :therapist, Types::TherapistType
    field :errors, [String], null: false
  
    def resolve(name:, practice_id:, address:, phone_number:, image_url:, bio:, labels:)
      therapist = Therapist.new(name: name, practice_id: practice_id, address: address, phone_number: phone_number, image_url: image_url, bio: bio, labels: labels)
  
      if therapist.save
        {
          therapist: therapist,
          errors: []
        }
      else
        {
          therapist: nil,
          errors: therapist.errors.full_messages.uniq
        }
      end
    end
  end

  