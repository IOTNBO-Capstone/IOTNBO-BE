module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :therapists, [Types::TherapistType], null: false

    def therapists
      Therapist.all
    end

    field :therapist, Types::TherapistType, null: false do
      argument :id, ID, required: true
    end

    def therapist(id:)
      Therapist.find(id)
    end

    field :practices, [Types::PracticeType], null: false

    def practices
      Practice.all
    end

    field :practice, Types::PracticeType, null: false do
      argument :id, ID, required: true
    end

    def practice(id:)
      Practice.find(id)
    end
   
  end
end
