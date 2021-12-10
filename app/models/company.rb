class Company < ApplicationRecord
  # Direct associations

  has_many   :jobs,
             :dependent => :destroy

  has_many   :interview_experience_posts,
             :dependent => :destroy

  # Indirect associations

  has_many   :students,
             :through => :interview_experience_posts,
             :source => :student

  # Validations

  # Scopes

  def to_s
    name
  end

end
