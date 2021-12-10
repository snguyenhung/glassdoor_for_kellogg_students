class InterviewExperiencePost < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :compensation, :numericality => { :greater_than => 0 }

  validates :student_id, :presence => true

  # Scopes

  def to_s
    student.to_s
  end

end
