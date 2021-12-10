require 'rails_helper'

RSpec.describe "student_profiles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/student_profiles/#{student_profile.id}", params: params
  end

  describe 'basic fetch' do
    let!(:student_profile) { create(:student_profile) }

    it 'works' do
      expect(StudentProfileResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('student_profiles')
      expect(d.id).to eq(student_profile.id)
    end
  end
end
