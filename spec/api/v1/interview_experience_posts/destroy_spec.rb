require 'rails_helper'

RSpec.describe "interview_experience_posts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/interview_experience_posts/#{interview_experience_post.id}"
  end

  describe 'basic destroy' do
    let!(:interview_experience_post) { create(:interview_experience_post) }

    it 'updates the resource' do
      expect(InterviewExperiencePostResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { InterviewExperiencePost.count }.by(-1)
      expect { interview_experience_post.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
