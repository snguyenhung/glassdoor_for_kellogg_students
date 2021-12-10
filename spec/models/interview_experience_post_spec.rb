require "rails_helper"

RSpec.describe InterviewExperiencePost, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:company) }

    it { should belong_to(:job) }

    it { should belong_to(:student) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:anonymous) }

    it { should validate_numericality_of(:compensation).is_greater_than(0) }

    it { should validate_presence_of(:student_id) }
  end
end
