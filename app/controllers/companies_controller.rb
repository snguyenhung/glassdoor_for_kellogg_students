class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @q = Company.ransack(params[:q])
    @companies = @q.result(distinct: true).includes(
      :interview_experience_posts, :jobs, :students
    ).page(params[:page]).per(10)
  end

  def show
    @job = Job.new
    @interview_experience_post = InterviewExperiencePost.new
  end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: "Company was successfully created."
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Company was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, notice: "Company was successfully destroyed."
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name)
  end
end
