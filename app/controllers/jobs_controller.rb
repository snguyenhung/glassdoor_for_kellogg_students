class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]

  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true).includes(:interview_experience_posts,
                                               :company, :students).page(params[:page]).per(10)
  end

  def show
    @interview_experience_post = InterviewExperiencePost.new
  end

  def new
    @job = Job.new
  end

  def edit; end

  def create
    @job = Job.new(job_params)

    if @job.save
      message = "Job was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @job, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Job was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    message = "Job was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to jobs_url, notice: message
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:company_id, :name)
  end
end
