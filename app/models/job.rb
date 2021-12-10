class Job < ApplicationRecord
  # Direct associations

  belongs_to :company

  has_many   :interview_experience_posts,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    company.to_s
  end

end
