class InterviewExperiencePostResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :student_id, :integer
  attribute :anonymous, :string
  attribute :company_id, :integer
  attribute :job_id, :integer
  attribute :preparation_experience, :string
  attribute :date_of_interview, :date
  attribute :resources_used, :string
  attribute :interview_experience, :string
  attribute :offer_status, :string
  attribute :compensation, :integer

  # Direct associations

  belongs_to :company

  belongs_to :job

  belongs_to :student,
             resource: StudentProfileResource

  # Indirect associations

end
