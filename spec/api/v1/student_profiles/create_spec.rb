require 'rails_helper'

RSpec.describe "student_profiles#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/student_profiles", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'student_profiles',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(StudentProfileResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { StudentProfile.count }.by(1)
    end
  end
end
