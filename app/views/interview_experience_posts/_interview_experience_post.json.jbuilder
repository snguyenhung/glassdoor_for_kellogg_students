json.extract! interview_experience_post, :id, :student_id, :anonymous,
              :company_id, :job_id, :preparation_experience, :date_of_interview, :resources_used, :interview_experience, :offer_status, :compensation, :created_at, :updated_at
json.url interview_experience_post_url(interview_experience_post, format: :json)
