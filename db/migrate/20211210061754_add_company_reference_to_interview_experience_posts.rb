class AddCompanyReferenceToInterviewExperiencePosts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :interview_experience_posts, :companies
    add_index :interview_experience_posts, :company_id
    change_column_null :interview_experience_posts, :company_id, false
  end
end
