require 'rails_helper'

RSpec.describe Company, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:jobs) }

    it { should have_many(:interview_experience_posts) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
