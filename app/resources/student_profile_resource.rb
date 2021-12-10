class StudentProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :program, :string
  attribute :graduation_year, :date

  # Direct associations

  has_many   :interview_experience_posts,
             foreign_key: :student_id

  # Indirect associations

  many_to_many :companies

end
