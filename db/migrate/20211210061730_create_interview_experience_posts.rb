class CreateInterviewExperiencePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :interview_experience_posts do |t|
      t.integer :student_id
      t.string :anonymous
      t.integer :company_id
      t.integer :job_id
      t.text :preparation_experience
      t.date :date_of_interview
      t.text :resources_used
      t.text :interview_experience
      t.string :offer_status
      t.integer :compensation

      t.timestamps
    end
  end
end
