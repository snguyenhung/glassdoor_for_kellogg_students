require "rails_helper"

RSpec.describe Job, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:company) }

    it { should have_many(:interview_experience_posts) }
  end

  describe "InDirect Associations" do
    it { should have_many(:students) }
  end

  describe "Validations" do
  end
end
