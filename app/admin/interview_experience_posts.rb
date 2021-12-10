ActiveAdmin.register InterviewExperiencePost do

 permit_params :student_id, :anonymous, :company_id, :job_id, :preparation_experience, :date_of_interview, :resources_used, :interview_experience, :offer_status, :compensation

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
