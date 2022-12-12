module Types
  class MutationType < Types::BaseObject
    field :create_therapist, mutation: Mutations::CreateTherapist
  end
end
