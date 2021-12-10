class CompanyResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string

  # Direct associations

  has_many   :jobs

  has_many   :interview_experience_posts

  # Indirect associations

  many_to_many :students,
               resource: StudentProfileResource

end
