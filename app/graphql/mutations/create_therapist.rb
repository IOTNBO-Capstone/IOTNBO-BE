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
  
    def resolve(practice_id:, **attributes)
      therapist = Practice.find(practice_id).therapists.new(attributes)
  
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

  