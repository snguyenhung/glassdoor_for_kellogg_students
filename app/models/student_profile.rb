class StudentProfile < ApplicationRecord
  # Direct associations

  has_many   :interview_experience_posts,
             :foreign_key => "student_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :companies,
             :through => :interview_experience_posts,
             :source => :company

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
