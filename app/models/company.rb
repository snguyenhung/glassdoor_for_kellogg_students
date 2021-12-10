class Company < ApplicationRecord
  # Direct associations

  has_many   :jobs,
             :dependent => :destroy

  has_many   :interview_experience_posts,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
