class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]

  # GET /jobs
  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true).includes(:interview_experience_posts,
                                               :company, :students).page(params[:page]).per(10)
  end

  # GET /jobs/1
  def show
    @interview_experience_post = InterviewExperiencePost.new
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit; end

  # POST /jobs
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

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Job was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /jobs/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def job_params
    params.require(:job).permit(:company_id, :name)
  end
end
