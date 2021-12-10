class InterviewExperiencePost < ApplicationRecord
  # Direct associations

  belongs_to :company

  belongs_to :job

  belongs_to :student,
             :class_name => "StudentProfile"

  # Indirect associations

  # Validations

  validates :anonymous, :presence => true

  validates :compensation, :numericality => { :greater_than => 0 }

  validates :student_id, :presence => true

  # Scopes

  def to_s
    student.to_s
  end

end
