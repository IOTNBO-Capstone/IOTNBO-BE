module Types
  class MutationType < Types::BaseObject
    field :create_therapist, mutation: Mutations::CreateTherapist
    field :create_practice, mutation: Mutations::CreatePractice
  end
end
