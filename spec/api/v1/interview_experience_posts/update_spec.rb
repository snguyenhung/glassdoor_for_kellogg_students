require 'rails_helper'

RSpec.describe "interview_experience_posts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/interview_experience_posts/#{interview_experience_post.id}", payload
  end

  describe 'basic update' do
    let!(:interview_experience_post) { create(:interview_experience_post) }

    let(:payload) do
      {
        data: {
          id: interview_experience_post.id.to_s,
          type: 'interview_experience_posts',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(InterviewExperiencePostResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { interview_experience_post.reload.attributes }
    end
  end
end
