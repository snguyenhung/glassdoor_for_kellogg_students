require 'rails_helper'

RSpec.describe "student_profiles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/student_profiles/#{student_profile.id}", payload
  end

  describe 'basic update' do
    let!(:student_profile) { create(:student_profile) }

    let(:payload) do
      {
        data: {
          id: student_profile.id.to_s,
          type: 'student_profiles',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(StudentProfileResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { student_profile.reload.attributes }
    end
  end
end
