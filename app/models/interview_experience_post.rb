class InterviewExperiencePost < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :student_id, :presence => true

  # Scopes

  def to_s
    student.to_s
  end

end
