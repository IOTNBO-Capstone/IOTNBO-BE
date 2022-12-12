class Mutations::CreatePractice < Mutations::BaseMutation
  argument :name, String, required: true
  argument :website_url, String, required: true

  field :practice, Types::PracticeType
  field :errors, [String], null: false 

  def resolve(name:, website_url:)
    practice = Practice.new(name: name, website_url: website_url)

    if practice.save
      {
        practice: practice,
        errors: []
      }
    else
      {
        practice: nil,
        errors: practice.errors.full_messages.uniq
      }
    end
  end
end

