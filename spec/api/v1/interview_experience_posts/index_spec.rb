require "rails_helper"

RSpec.describe "interview_experience_posts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interview_experience_posts", params: params
  end

  describe "basic fetch" do
    let!(:interview_experience_post1) { create(:interview_experience_post) }
    let!(:interview_experience_post2) { create(:interview_experience_post) }

    it "works" do
      expect(InterviewExperiencePostResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["interview_experience_posts"])
      expect(d.map(&:id)).to match_array([interview_experience_post1.id,
                                          interview_experience_post2.id])
    end
  end
end
