class InterviewExperiencePostsController < ApplicationController
  before_action :current_student_profile_must_be_interview_experience_post_student,
                only: %i[edit update destroy]

  before_action :set_interview_experience_post,
                only: %i[show edit update destroy]

  def index
    @q = InterviewExperiencePost.ransack(params[:q])
    @interview_experience_posts = @q.result(distinct: true).includes(
      :student, :job, :company
    ).page(params[:page]).per(10)
  end

  def show; end

  def new
    @interview_experience_post = InterviewExperiencePost.new
  end

  def edit; end

  def create
    @interview_experience_post = InterviewExperiencePost.new(interview_experience_post_params)

    if @interview_experience_post.save
      message = "InterviewExperiencePost was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @interview_experience_post, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @interview_experience_post.update(interview_experience_post_params)
      redirect_to @interview_experience_post,
                  notice: "Interview experience post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @interview_experience_post.destroy
    message = "InterviewExperiencePost was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to interview_experience_posts_url, notice: message
    end
  end

  private

  def current_student_profile_must_be_interview_experience_post_student
    set_interview_experience_post
    unless current_student_profile == @interview_experience_post.student
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_interview_experience_post
    @interview_experience_post = InterviewExperiencePost.find(params[:id])
  end

  def interview_experience_post_params
    params.require(:interview_experience_post).permit(:student_id,
                                                      :anonymous, :company_id, :job_id, :preparation_experience, :date_of_interview, :resources_used, :interview_experience, :offer_status, :compensation)
  end
end
