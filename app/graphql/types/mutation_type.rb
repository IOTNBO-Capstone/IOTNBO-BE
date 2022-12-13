module Types
  class MutationType < Types::BaseObject
    field :create_therapist, mutation: Mutations::CreateTherapist
    field :update_therapist, mutation: Mutations::UpdateTherapist
    field :create_practice, mutation: Mutations::CreatePractice
  end
end
