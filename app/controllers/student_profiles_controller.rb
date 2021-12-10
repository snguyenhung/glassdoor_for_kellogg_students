class StudentProfilesController < ApplicationController
  before_action :set_student_profile, only: %i[show edit update destroy]

  def index
    @student_profiles = StudentProfile.page(params[:page]).per(10)
  end

  def show
    @interview_experience_post = InterviewExperiencePost.new
  end

  def new
    @student_profile = StudentProfile.new
  end

  def edit; end

  def create
    @student_profile = StudentProfile.new(student_profile_params)

    if @student_profile.save
      redirect_to @student_profile,
                  notice: "Student profile was successfully created."
    else
      render :new
    end
  end

  def update
    if @student_profile.update(student_profile_params)
      redirect_to @student_profile,
                  notice: "Student profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @student_profile.destroy
    redirect_to student_profiles_url,
                notice: "Student profile was successfully destroyed."
  end

  private

  def set_student_profile
    @student_profile = StudentProfile.find(params[:id])
  end

  def student_profile_params
    params.require(:student_profile).permit(:program, :graduation_year)
  end
end
