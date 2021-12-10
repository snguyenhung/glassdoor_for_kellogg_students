class AddStudentReferenceToInterviewExperiencePosts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interview_experience_posts, :student_profiles, column: :student_id
    add_index :interview_experience_posts, :student_id
    change_column_null :interview_experience_posts, :student_id, false
  end
end
