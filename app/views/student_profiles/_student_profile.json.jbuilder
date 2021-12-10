json.extract! student_profile, :id, :program, :graduation_year, :created_at, :updated_at
json.url student_profile_url(student_profile, format: :json)
json.token user.generate_jwt