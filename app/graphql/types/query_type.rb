require 'pry'
module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :therapists, [Types::TherapistType], null: false do
      argument :labels, [String], required: false
    end

    def therapists(labels: nil)
      if labels.present?
        therapists = []
        Therapist.all.each do |therapist|
          labels.each do |label|
            if therapist.labels.include?(label)
              binding.pry
              therapists << therapist 
            end
          end
        end
        therapists.uniq
      else
        Therapist.all
      end
    end

    field :therapist, Types::TherapistType, null: false do
      argument :id, ID, required: true
    end

    def therapist(id:)
      Therapist.find(id)
    end

    #Therapist.includes(:therapists).where(labels: labels)
    # field :therapists, Types::TherapistType, null: false do
    #   argument :labels, [String], required: true
    # end
    # , "LGBTQ+", "In-house Pharmacy", "Works with Anxiety", "Works with Trauma-based disorders"
    # def therapists(labels:)
    #   binding.pry
    #   Therapist.find(id)
    # end

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
