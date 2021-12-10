class Api::V1::StudentProfilesController < Api::V1::GraphitiController
  def index
    student_profiles = StudentProfileResource.all(params)
    respond_with(student_profiles)
  end

  def show
    student_profile = StudentProfileResource.find(params)
    respond_with(student_profile)
  end

  def create
    student_profile = StudentProfileResource.build(params)

    if student_profile.save
      render jsonapi: student_profile, status: 201
    else
      render jsonapi_errors: student_profile
    end
  end

  def update
    student_profile = StudentProfileResource.find(params)

    if student_profile.update_attributes
      render jsonapi: student_profile
    else
      render jsonapi_errors: student_profile
    end
  end

  def destroy
    student_profile = StudentProfileResource.find(params)

    if student_profile.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: student_profile
    end
  end
end
