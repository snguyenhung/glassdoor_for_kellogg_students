class InterviewExperiencePostsController < ApplicationController
  before_action :set_interview_experience_post, only: [:show, :edit, :update, :destroy]

  # GET /interview_experience_posts
  def index
    @interview_experience_posts = InterviewExperiencePost.all
  end

  # GET /interview_experience_posts/1
  def show
  end

  # GET /interview_experience_posts/new
  def new
    @interview_experience_post = InterviewExperiencePost.new
  end

  # GET /interview_experience_posts/1/edit
  def edit
  end

  # POST /interview_experience_posts
  def create
    @interview_experience_post = InterviewExperiencePost.new(interview_experience_post_params)

    if @interview_experience_post.save
      redirect_to @interview_experience_post, notice: 'Interview experience post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /interview_experience_posts/1
  def update
    if @interview_experience_post.update(interview_experience_post_params)
      redirect_to @interview_experience_post, notice: 'Interview experience post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interview_experience_posts/1
  def destroy
    @interview_experience_post.destroy
    redirect_to interview_experience_posts_url, notice: 'Interview experience post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_experience_post
      @interview_experience_post = InterviewExperiencePost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interview_experience_post_params
      params.require(:interview_experience_post).permit(:student_id, :anonymous, :company_id, :job_id, :preparation_experience, :date_of_interview, :resources_used, :interview_experience, :offer_status, :compensation)
    end
end
