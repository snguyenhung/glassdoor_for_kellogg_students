class Api::V1::JobsController < Api::V1::GraphitiController
  def index
    jobs = JobResource.all(params)
    respond_with(jobs)
  end

  def show
    job = JobResource.find(params)
    respond_with(job)
  end

  def create
    job = JobResource.build(params)

    if job.save
      render jsonapi: job, status: 201
    else
      render jsonapi_errors: job
    end
  end

  def update
    job = JobResource.find(params)

    if job.update_attributes
      render jsonapi: job
    else
      render jsonapi_errors: job
    end
  end

  def destroy
    job = JobResource.find(params)

    if job.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: job
    end
  end
end
