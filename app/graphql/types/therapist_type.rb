# frozen_string_literal: true
# require 'pry'
module Types
  class TherapistType < Types::BaseObject
    field :id, ID, null: false
    field :address, String
    field :phone_number, String
    field :image_url, String
    field :bio, String
    field :labels, String
    field :practice_id, Integer
    field :practice, Types::PracticeType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :name, String
  end
end
