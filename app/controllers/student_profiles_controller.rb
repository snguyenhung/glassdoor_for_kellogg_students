class StudentProfilesController < ApplicationController
  before_action :set_student_profile, only: %i[show edit update destroy]

  # GET /student_profiles
  def index
    @student_profiles = StudentProfile.page(params[:page]).per(10)
  end

  # GET /student_profiles/1
  def show
    @interview_experience_post = InterviewExperiencePost.new
  end

  # GET /student_profiles/new
  def new
    @student_profile = StudentProfile.new
  end

  # GET /student_profiles/1/edit
  def edit; end

  # POST /student_profiles
  def create
    @student_profile = StudentProfile.new(student_profile_params)

    if @student_profile.save
      redirect_to @student_profile,
                  notice: "Student profile was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /student_profiles/1
  def update
    if @student_profile.update(student_profile_params)
      redirect_to @student_profile,
                  notice: "Student profile was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /student_profiles/1
  def destroy
    @student_profile.destroy
    redirect_to student_profiles_url,
                notice: "Student profile was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student_profile
    @student_profile = StudentProfile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def student_profile_params
    params.require(:student_profile).permit(:program, :graduation_year)
  end
end
