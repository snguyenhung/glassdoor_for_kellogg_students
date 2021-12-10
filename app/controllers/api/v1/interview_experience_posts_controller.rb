class Api::V1::InterviewExperiencePostsController < Api::V1::GraphitiController
  def index
    interview_experience_posts = InterviewExperiencePostResource.all(params)
    respond_with(interview_experience_posts)
  end

  def show
    interview_experience_post = InterviewExperiencePostResource.find(params)
    respond_with(interview_experience_post)
  end

  def create
    interview_experience_post = InterviewExperiencePostResource.build(params)

    if interview_experience_post.save
      render jsonapi: interview_experience_post, status: 201
    else
      render jsonapi_errors: interview_experience_post
    end
  end

  def update
    interview_experience_post = InterviewExperiencePostResource.find(params)

    if interview_experience_post.update_attributes
      render jsonapi: interview_experience_post
    else
      render jsonapi_errors: interview_experience_post
    end
  end

  def destroy
    interview_experience_post = InterviewExperiencePostResource.find(params)

    if interview_experience_post.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: interview_experience_post
    end
  end
end
