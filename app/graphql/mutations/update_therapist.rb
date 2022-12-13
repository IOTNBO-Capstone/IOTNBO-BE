class Mutations::UpdateTherapist < Mutations::BaseMutation
    argument :practice_id, Integer, required: false
    argument :name, String, required: false
    argument :address, String, required: false
    argument :phone_number, String, required: false
    argument :image_url, String, required: false
    argument :bio, String, required: false
    argument :labels, [String], required: false
    argument :id, Integer, required: true

    
    type Types::TherapistType
    field :therapist, Types::TherapistType
    field :errors, [String], null: false


    def resolve(id:, **attributes)
      therapist = Therapist.find(id)

      if therapist.update(attributes)
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
