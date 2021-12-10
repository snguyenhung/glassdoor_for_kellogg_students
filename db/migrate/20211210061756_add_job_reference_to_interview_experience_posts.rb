class AddJobReferenceToInterviewExperiencePosts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interview_experience_posts, :jobs
    add_index :interview_experience_posts, :job_id
    change_column_null :interview_experience_posts, :job_id, false
  end
end
