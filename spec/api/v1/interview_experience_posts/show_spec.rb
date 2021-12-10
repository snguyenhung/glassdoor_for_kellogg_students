require "rails_helper"

RSpec.describe "interview_experience_posts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interview_experience_posts/#{interview_experience_post.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:interview_experience_post) { create(:interview_experience_post) }

    it "works" do
      expect(InterviewExperiencePostResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("interview_experience_posts")
      expect(d.id).to eq(interview_experience_post.id)
    end
  end
end
