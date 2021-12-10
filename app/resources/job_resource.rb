class JobResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :company_id, :integer
  attribute :name, :string

  # Direct associations

  belongs_to :company

  has_many   :interview_experience_posts

  # Indirect associations

end
